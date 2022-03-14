import 'package:flutter/widgets.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:provider/provider.dart';

import '../../Domain/Cart/cart.dart';
import '../../Domain/Cart/cart_item.dart';
import '../../Domain/Orders/iorder.dart';
import '../../Infrastructure/Authentication/iauthentication_service.dart';
import '../../Infrastructure/Orders/iorder_service.dart';

class CartHelper {
  late final Cart _cart;
  late final IOrderService _orderService;
  late final IAuthenticationService _authenticationService;

  CartHelper(this._cart, this._orderService, this._authenticationService);

  void addCartItem(CartItem cartItem) {
    _cart.addProduct(product: cartItem);
  }

  int getCartItemCount() {
    return _cart.getProductsCount();
  }

  CartItem getProduct(int productId) {
    return _cart.getProduct(productId: productId);
  }

  void placeOrder(BuildContext context) {
    /*
    should check if logged in first , disabled for testing purpose;
    _authenticationService.accountIsActive().then((value) => _sendOrderToShop(
        value, Provider.of<NavigationProvider>(context), context));*/
    _sendOrderToShop(
        true, Provider.of<NavigationProvider>(context, listen: false), context);
  }

  void removeProduct(CartItem item) {
    _cart.removeProduct(item: item);
  }

  void _sendOrderToShop(bool isActive, NavigationProvider navigationProvider,
      BuildContext context) {
    if (isActive) {
      IOrder order = _cart.placeOrder();
      _orderService.sendOrderToShop(order, ProfileModel());
      _cart.clearCart();
    } else {
      navigationProvider.navigateToLogin(context);
    }
  }
}
