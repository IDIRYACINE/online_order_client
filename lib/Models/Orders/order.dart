import 'package:online_order_client/Models/Cart/icart_item.dart';
import 'package:online_order_client/Models/Orders/iorder.dart';

class Order implements IOrder {
  final Map<String, dynamic> _order = {};
  String _orderId = "0";
  String _orderStaus = "Waiting";

  Order([String? id, String? status]) {
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
    return _order;
  }

  @override
  Map<String, dynamic> toMap() {
    return {"status": _orderStaus};
  }

  @override
  String getStatus() {
    return _orderStaus;
  }

  @override
  String getId() {
    return _orderId;
  }

  @override
  void setStatus({required String status}) {
    _orderStaus = status;
  }
}
