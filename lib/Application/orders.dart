import 'package:flutter/foundation.dart';
import 'package:online_order_client/Models/Orders/iorder.dart';
import 'package:online_order_client/Models/Orders/order.dart';
import 'package:online_order_client/Utility/Orders/iorder_service.dart';
import 'package:online_order_client/Utility/Orders/iorder_subscriber.dart';
import 'package:online_order_client/Utility/Orders/order_service.dart';

class OrdersModel implements IOrderSubscriber {
  final String _id = "OrderScreen";
  late VoidCallback _callback;
  late IOrder _order;

  OrdersModel() {
    _order = Order(_id);
    IOrderService _orderService = OrderService();
    _orderService.sendOrderToShop(_order);
    _orderService.subscribeToOrdersStatus(this);
  }

  void subscribeToOrderStatusChange({required VoidCallback callback}) {
    _callback = callback;
  }

  void unsubscribeFromOrderStatusChange() {
    IOrderService _orderService = OrderService();
    _orderService.unsubscribeFromOrdersStatus(_id);
  }

  String get getOrderStatus => _order.getStatus();

  String get getOrderId => _id;

  @override
  String getId() {
    return _id;
  }

  @override
  void notify(String orderStatus) {
    _order.setStatus(status: orderStatus);
    _callback();
  }
}
