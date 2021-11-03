import 'package:online_order_client/Models/Products/iproduct.dart';

import 'icart.dart';

class CartModel implements ICart {
  static final CartModel _cartModel = CartModel._();
  final List<IProduct> _products = [];

  factory CartModel() {
    return _cartModel;
  }
  CartModel._();

  @override
  void addProduct({required IProduct product}) {
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
  bool placeOrder() {
    // TODO: implement placeOrder
    throw UnimplementedError();
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
  IProduct getProduct({required int productId}) {
    return _products[productId];
  }
}
