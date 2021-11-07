import 'dart:async';

import 'package:online_order_client/Models/Orders/iorder.dart';
import 'package:online_order_client/Utility/Server/firebase_service.dart';
import 'package:online_order_client/Utility/Server/ionline_data_service.dart';
import 'package:online_order_client/Utility/Orders/iorder_service.dart';
import 'package:online_order_client/Utility/Orders/iorder_subscriber.dart';

class OrderService implements IOrderService {
  static final OrderService _instance = OrderService._();
  late final StreamSubscription _ordersStatusSubscription;
  final Map<String, IOrderSubscriber> _ordersStatusSubscribers = {};
  bool _isSubscribedToServer = false;

  factory OrderService() {
    return _instance;
  }
  OrderService._();

  @override
  void subscribeToOrdersStatus(IOrderSubscriber subscriber) {
    String subscriberId = subscriber.getId();
    _ordersStatusSubscribers[subscriberId] = subscriber;
  }

  @override
  void unsubscribeFromOrdersStatus(String subscriberId) {
    _ordersStatusSubscribers.remove(subscriberId);
  }

  @override
  void sendOrderToShop(IOrder order) {
    IOnlineServerAcess serverAcess = FireBaseServices();
    Map<String, dynamic> _orderMap = order.toMap();
    serverAcess.postData(dataUrl: "OrdersStatus/idir", data: _orderMap);
    _orderMap = order.formatOnlineOrder();
    serverAcess.postData(dataUrl: 'Orders', data: _orderMap);
    listenToOrderStatusOnServer();
  }

  @override
  void listenToOrderStatusOnServer() {
    IOnlineServerAcess serverAcess = FireBaseServices();
    if (!_isSubscribedToServer) {
      _ordersStatusSubscription = serverAcess
          .getDataStream(dataUrl: "OrdersStatus/idir/status")
          .listen((event) {
        String? status = event.snapshot.value;
        if (status != null) {
          _ordersStatusSubscribers.forEach((key, subscriber) {
            subscriber.notify(status);
          });
        } else {
          cancelAllSubscribtions();
        }
      });
      _isSubscribedToServer = true;
    }
  }

  @override
  void cancelAllSubscribtions() {
    _ordersStatusSubscribers.clear();
    _ordersStatusSubscription.cancel();
    _isSubscribedToServer = false;
  }
}
