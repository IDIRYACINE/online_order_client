import 'package:flutter/widgets.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_subscriber.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

class OrderStatusProvider with ChangeNotifier implements IOrderSubscriber {
  final String _id = "OrderStatusScreen";

  String _orderStatus = OrderStatus.waiting as String;

  OrderStatusProvider() {
    ServicesProvider().orderService.subscribeToOrdersStatus(this);
  }

  void unsbscribeFromStatusStream() {
    ServicesProvider().orderService.unsubscribeFromOrdersStatus(_id);
  }

  @override
  String getId() {
    return _id;
  }

  @override
  void notify(String orderStatus) {
    _orderStatus = orderStatus;
    notifyListeners();
  }

  String get orderStatus => _orderStatus;
}

enum OrderStatus { waiting, confirmed, onDelivery, delivered }
