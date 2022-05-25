import 'dart:async';

import 'package:flutter/services.dart';
import 'package:online_order_client/Domain/Orders/order_status.dart';
import 'package:online_order_client/Infrastructure/Server/ionline_data_service.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_service.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_subscriber.dart';
import 'dart:developer' as dev;

class OrderService implements IOrderService {
  static const _orderStatusChannelName = "online_order_client/order_status";

  StreamSubscription? _ordersStatusSubscription;

  final Map<String, IOrderSubscriber> _ordersStatusSubscribers = {};

  final IOnlineServerAcess _serverAcess;

  String? _latestOrderStatus;

  final EventChannel _orderStatusChannel =
      const EventChannel(_orderStatusChannelName);

  /// Defining Method Channel and it's functions
  static const _controlsChannelName = "online_order_client/controls";

  static const _listenToOrderStatusMethod = "listenToOrderStatus";

  final MethodChannel _controlsChannel =
      const MethodChannel(_controlsChannelName);

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
    _controlsChannel.invokeMethod(
        _listenToOrderStatusMethod, {"userId": userId}).then((value) {
      dev.log(value);
      _ordersStatusSubscription =
          _orderStatusChannel.receiveBroadcastStream().listen((event) {
        _latestOrderStatus = event;
        dev.log('here : ${event}');
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
}
