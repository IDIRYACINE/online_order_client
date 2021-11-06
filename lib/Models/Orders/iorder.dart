import 'package:online_order_client/Models/Cart/icart_item.dart';

abstract class IOrder {
  void setId({required String orderId});
  String getId();
  Map<String, dynamic> formatOnlineOrder();
  void mapCartItemToOrder({required ICartItem cartItem});
  String toJson();
}
