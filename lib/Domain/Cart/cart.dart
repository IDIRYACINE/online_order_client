import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Domain/Orders/iorder.dart';
import 'package:online_order_client/Domain/Orders/order.dart';

class Cart {
  static final Cart _cartModel = Cart._();
  final List<CartItem> _products = [];

  factory Cart() {
    return _cartModel;
  }
  Cart._();

  void addProduct({required CartItem product}) {
    _products.add(product);
  }

  void clearCart() {
    _products.clear();
  }

  double getTotalPrice() {
    double totalPrice = 0;
    int productsCount = getProductsCount();
    for (int i = 0; i < productsCount; i++) {
      totalPrice += _products[i].getPrice();
    }
    return totalPrice;
  }

  IOrder placeOrder() {
    IOrder order = Order();
    for (CartItem _cartItem in _products) {
      order.mapCartItemToOrder(cartItem: _cartItem);
    }
    return order;
  }

  void removeProduct({required CartItem item}) {
    _products.remove(item);
  }

  int getProductsCount() {
    return _products.length;
  }

  CartItem getProduct({required int productId}) {
    return _products[productId];
  }
}
