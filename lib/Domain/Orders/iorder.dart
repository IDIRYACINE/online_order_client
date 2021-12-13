import 'package:online_order_client/Domain/Cart/cart_item.dart';

abstract class IOrder {
  String getId();
  String getStatus();
  void setStatus({required String status});
  Map<String, dynamic> formatOnlineOrder();
  void mapCartItemToOrder({required CartItem cartItem});
  Map<String, dynamic> toMap();
}
