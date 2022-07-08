import 'dart:async';

import 'package:online_order_client/Domain/Orders/order_status.dart';
import 'package:online_order_client/Infrastructure/Server/ionline_data_service.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_service.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_subscriber.dart';

class OrderService implements IOrderService {
  StreamSubscription? _ordersStatusSubscription;

  final Map<String, IOrderSubscriber> _ordersStatusSubscribers = {};

  final IOnlineServerAcess _serverAcess;

  String? _latestOrderStatus;

  OrderService(this._serverAcess);

  @override
  void subscribeToOrdersStatus(IOrderSubscriber subscriber) {
    String subscriberId = subscriber.getId();
    _ordersStatusSubscribers[subscriberId] = subscriber;

    if (_latestOrderStatus != null) {
      subscriber.notify(_latestOrderStatus!, false);
    }
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
    /*_controlsChannel.invokeMethod(
        _listenToOrderStatusMethod, {"userId": userId}).then((value) {
     
      _ordersStatusSubscription =
          _orderStatusChannel.receiveBroadcastStream().listen((event) {
        _latestOrderStatus = event;
       
        if (_checkValidState()) {
          _ordersStatusSubscribers.forEach((key, subscriber) {
            subscriber.notify(_latestOrderStatus!);
          });
        } else {
          _ordersStatusSubscribers.forEach((key, subscriber) {
            subscriber.notify(OrderStatus.noOrder);
          });
        }
      });
    });*/
    _ordersStatusSubscription ??= _serverAcess
        .getDataStream(dataUrl: "OrdersStatus/$userId/status")
        .listen((event) {
      _latestOrderStatus = event.snapshot.value as String?;
      if (_checkValidState()) {
        _ordersStatusSubscribers.forEach((key, subscriber) {
          subscriber.notify(_latestOrderStatus!);
        });
      } else {
        _ordersStatusSubscribers.forEach((key, subscriber) {
          subscriber.notify(OrderStatus.noOrder);
        });
      }
    });
  }

  @override
  void cancelAllSubscribtions() {
    _ordersStatusSubscribers.clear();
    if (_ordersStatusSubscription != null) {
      _ordersStatusSubscription!.cancel();
    }
    _ordersStatusSubscription = null;
  }

  bool _checkValidState() {
    return (_latestOrderStatus != null) &&
        (_latestOrderStatus != "") &&
        (_latestOrderStatus != "null");
  }

  @override
  bool canModifyOrder() {
    return (!_checkValidState() || (_latestOrderStatus == OrderStatus.waiting));
  }
}
