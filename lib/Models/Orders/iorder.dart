import 'package:online_order_client/Models/Cart/icart_item.dart';

abstract class IOrder {
  String getId();
  String getStatus();
  void setStatus({required String status});
  Map<String, dynamic> formatOnlineOrder();
  void mapCartItemToOrder({required ICartItem cartItem});
  Map<String, dynamic> toMap();
}
