// ignore_for_file: unused_field

import 'dart:async';

import 'package:online_order_client/Domain/Orders/iorder.dart';
import 'package:online_order_client/Domain/Profile/iprofile.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Infrastructure/Server/ionline_data_service.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_service.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_subscriber.dart';

class OrderService implements IOrderService {
  late final StreamSubscription _ordersStatusSubscription;
  final Map<String, IOrderSubscriber> _ordersStatusSubscribers = {};
  bool _isSubscribedToServer = false;
  final IOnlineServerAcess _serverAcess;
  final IAuthenticationService _authenticationService;

  OrderService(this._serverAcess, this._authenticationService);
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
    IProfile profile = ProfileModel();
    Map<String, dynamic> _orderMap = order.toMap();
    _serverAcess.postData(
        dataUrl: "OrdersStatus/${profile.getUserId()}", data: _orderMap);
    _orderMap = order.formatOnlineOrder();
    _serverAcess.postData(dataUrl: 'Orders', data: _orderMap);
    listenToOrderStatusOnServer();
  }

  @override
  void listenToOrderStatusOnServer() {
    if (!_isSubscribedToServer) {
      IProfile profile = ProfileModel();
      _ordersStatusSubscription = _serverAcess
          .getDataStream(dataUrl: "OrdersStatus/${profile.getUserId()}/status")
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
