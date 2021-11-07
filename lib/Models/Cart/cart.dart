import 'package:online_order_client/Models/Cart/icart_item.dart';
import 'package:online_order_client/Models/Orders/iorder.dart';
import 'package:online_order_client/Models/Orders/order.dart';

import 'icart.dart';

class Cart implements ICart {
  static final Cart _cartModel = Cart._();
  final List<ICartItem> _products = [];

  factory Cart() {
    return _cartModel;
  }
  Cart._();

  @override
  void addProduct({required ICartItem product}) {
    _products.add(product);
  }

  @override
  void clearCart() {
    _products.clear();
  }

  @override
  double getTotalPrice() {
    double totalPrice = 0;
    int productsCount = getProductsCount();
    for (int i = 0; i < productsCount; i++) {
      totalPrice += _products[i].getPrice();
    }
    return totalPrice;
  }

  @override
  IOrder placeOrder() {
    IOrder order = Order();
    for (ICartItem _cartItem in _products) {
      order.mapCartItemToOrder(cartItem: _cartItem);
    }
    return order;
  }

  @override
  void removeProduct({required int productId}) {
    _products.removeAt(productId);
  }

  @override
  int getProductsCount() {
    return _products.length;
  }

  @override
  ICartItem getProduct({required int productId}) {
    return _products[productId];
  }
}
