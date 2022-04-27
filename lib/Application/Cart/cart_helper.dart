import 'package:flutter/widgets.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';
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
  late final VoidCallback _notifyChange;

  CartHelper(this._cart, this._orderService, this._authenticationService,
      this._notifyChange);

  void addCartItem(CartItem cartItem, BuildContext context) {
    if (cartItem.getQuantity() != 0) {
      _cart.addProduct(product: cartItem);
      _notifyChange();
    } else {
      sendCodeAlert(context, "Can't add 0 units to cart");
    }
  }

  int getCartItemCount() {
    return _cart.getProductsCount();
  }

  CartItem getProduct(int productId) {
    return _cart.getProduct(productId: productId);
  }

  void placeOrder(BuildContext context) {
    IOrder order = _cart.placeOrder();
    ProfileModel profile = Provider.of<HelpersProvider>(context, listen: false)
        .authHelper
        .getProfile();

    Map<String, dynamic> result = {
      "order": order.formatOnlineOrder(),
      "infos": profile.getProfileJson()
    };

    _authenticationService
        .accountIsActive()
        .then((value) => _sendOrderToShop(value, result, context));
  }

  void removeProduct(CartItem item) {
    _cart.removeProduct(item: item);
    _notifyChange();
  }

  void _sendOrderToShop(
      bool isActive, Map<String, dynamic> orderJson, BuildContext context) {
    if (isActive) {
      _orderService.sendOrderToShop(orderJson, _authenticationService.getId());
      _cart.clearCart();
    } else {
      Provider.of<NavigationProvider>(context, listen: false)
          .navigateToLogin(context);
    }
  }

  String getTotalPrice() {
    return _cart.getTotalPrice().toStringAsFixed(2);
  }
}
