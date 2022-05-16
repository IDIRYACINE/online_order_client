import 'dart:async';

import 'package:online_order_client/Domain/Orders/order_status.dart';
import 'package:online_order_client/Infrastructure/Server/ionline_data_service.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_service.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_subscriber.dart';

class OrderService implements IOrderService {
  StreamSubscription? _ordersStatusSubscription;
  final Map<String, IOrderSubscriber> _ordersStatusSubscribers = {};
  final IOnlineServerAcess _serverAcess;

  bool _isSubscribedToServer = false;

  OrderService(this._serverAcess);
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
  void sendOrderToShop(Map<String, dynamic> order, String userId) {
    _serverAcess
        .postData(dataUrl: 'Orders/$userId', data: order)
        .then((value) => {
              _serverAcess.postData(
                  dataUrl: "OrdersStatus/$userId",
                  data: {"status": OrderStatus.waiting})
            })
        .then((value) => {listenToOrderStatusOnServer(userId)});
  }

  @override
  void listenToOrderStatusOnServer(String userId) {
    if (!_isSubscribedToServer) {
      _ordersStatusSubscription = _serverAcess
          .getDataStream(dataUrl: "OrdersStatus/$userId/status")
          .listen((event) {
        String? status = event.snapshot.value;
        if (status != null) {
          _ordersStatusSubscribers.forEach((key, subscriber) {
            subscriber.notify(status);
          });
        } else {
          _ordersStatusSubscribers.forEach((key, subscriber) {
            subscriber.notify(OrderStatus.noOrder);
          });
          cancelAllSubscribtions();
        }
      });
      _isSubscribedToServer = true;
    }
  }

  @override
  void cancelAllSubscribtions() {
    _ordersStatusSubscribers.clear();
    if (_ordersStatusSubscription != null) {
      _ordersStatusSubscription!.cancel();
    }
    _isSubscribedToServer = false;
  }
}
