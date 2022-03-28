import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Domain/Orders/iorder.dart';

class Order implements IOrder {
  final List<Map<String, dynamic>> _items = [];
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
  void mapCartItemToOrder({required CartItem cartItem}) {
    _items.add(cartItem.getOnlineMap());
  }

  @override
  Map<String, dynamic> formatOnlineOrder() {
    return {'items': _items};
  }

  @override
  Map<String, dynamic> orderStatusJson() {
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
