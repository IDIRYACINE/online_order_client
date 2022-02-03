import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:online_order_client/Domain/Cart/cart.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

import '../../Domain/Catalogue/catalogue_model.dart';

class CatalogueProvider with ChangeNotifier {
  late final CatalogueModel _catalogueModel;
  late final Cart _cart;

  CatalogueProvider() {
    _catalogueModel = CatalogueModel();
    _cart = Cart();
  }

  Future<bool> initApp() async {
    await Firebase.initializeApp();
    ServicesProvider services = ServicesProvider();
    await services.initialiaze();
    await services.productDatabase.connect();
    await _catalogueModel.initCategories();
    return true;
  }

  Category getCategory(int categoryIndex) {
    return _catalogueModel.getCategory(categoryIndex: categoryIndex);
  }

  int getCategoriesCount() {
    return _catalogueModel.getCategoriesCount();
  }

  void addCartItem(CartItem cartItem) {
    _cart.addProduct(product: cartItem);
    notifyListeners();
  }

  int getCartItemCount() {
    return _cart.getProductsCount();
  }

  CartItem getProduct({required int productId}) {
    return _cart.getProduct(productId: productId);
  }

  void placeOrder() {
    _cart.placeOrder();
  }

  void clearCart() {
    _cart.clearCart();
    notifyListeners();
  }

  void removeProduct({required CartItem item}) {
    _cart.removeProduct(item: item);
    notifyListeners();
  }
}
