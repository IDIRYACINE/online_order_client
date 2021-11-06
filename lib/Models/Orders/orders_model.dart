import 'dart:convert';

import 'package:online_order_client/Models/Cart/icart_item.dart';
import 'package:online_order_client/Models/Orders/iorder.dart';
import 'package:online_order_client/Utility/Orders/iorder_subscriber.dart';

class OrdersModel implements IOrder, IOrderSubscriber {
  final Map<String, dynamic> _order = {};
  late final String _orderId;
  String _orderStaus = "Waiting";

  OrdersModel([String? id, String? status]) {
    if (id != null) {
      _orderId = id;
    }
    if (status != null) {
      _orderStaus = status;
    }
  }

  @override
  void mapCartItemToOrder({required ICartItem cartItem}) {
    String itemId = cartItem.getId();
    _order[itemId] = cartItem.getOnlineMap();
  }

  @override
  Map<String, dynamic> formatOnlineOrder() {
    return {_orderId: _order};
  }

  @override
  void setId({required String orderId}) {
    _orderId = orderId;
  }

  @override
  String getId() {
    return _orderId;
  }

  @override
  String toJson() {
    return jsonEncode({"orderId": _orderId, "orderStatus": _orderStaus});
  }

  @override
  void notify(String orderStatus) {
    _orderStaus = orderStatus;
  }
}
