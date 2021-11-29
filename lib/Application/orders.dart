import 'package:flutter/foundation.dart';
import 'package:online_order_client/Domain/Orders/iorder.dart';
import 'package:online_order_client/Domain/Orders/order.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_service.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_subscriber.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

class OrdersModel implements IOrderSubscriber {
  final String _id = "OrderScreen";
  late VoidCallback _callback;
  late IOrder _order;
  late IOrderService _orderService;

  OrdersModel() {
    _order = Order(_id);
    _orderService = ServicesProvider().orderService;
    _orderService.sendOrderToShop(_order);
    _orderService.subscribeToOrdersStatus(this);
  }

  void subscribeToOrderStatusChange({required VoidCallback callback}) {
    _callback = callback;
  }

  void unsubscribeFromOrderStatusChange() {
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
