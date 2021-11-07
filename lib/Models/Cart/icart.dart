import 'package:online_order_client/Models/Cart/icart_item.dart';
import 'package:online_order_client/Models/Orders/iorder.dart';

abstract class ICart {
  void addProduct({required ICartItem product});
  void removeProduct({required int productId});
  void clearCart();
  double getTotalPrice();
  IOrder placeOrder();
  int getProductsCount();
  ICartItem getProduct({required int productId});
}
