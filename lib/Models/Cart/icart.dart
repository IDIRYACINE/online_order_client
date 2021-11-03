import 'package:online_order_client/Models/Products/iproduct.dart';

abstract class ICart {
  void addProduct({required IProduct product});
  void removeProduct({required int productId});
  void clearCart();
  double getTotalPrice();
  bool placeOrder();
  int getProductsCount();
  IProduct getProduct({required int productId});
}
