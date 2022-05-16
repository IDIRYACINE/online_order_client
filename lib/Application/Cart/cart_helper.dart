import 'package:flutter/widgets.dart';
import 'package:online_order_client/Application/DeliveryAddress/latlng.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Cart/cart.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Domain/GpsLocation/address.dart';
import 'package:online_order_client/Domain/Orders/iorder.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_service.dart';
import 'package:provider/provider.dart';

class CartHelper {
  final Cart _cart;
  final IOrderService _orderService;
  final IAuthenticationService _authenticationService;
  final VoidCallback _notifyChange;

  CartHelper(this._cart, this._orderService, this._authenticationService,
      this._notifyChange);

  void addCartItem(CartItem cartItem, BuildContext context) {
    _cart.addProduct(product: cartItem);
    _notifyChange();
  }

  int getCartItemCount() {
    return _cart.getProductsCount();
  }

  CartItem getProduct(int productId) {
    return _cart.getProduct(productId: productId);
  }

  void placeOrder(BuildContext context) {
    _authenticationService.accountIsActive().then((isActive) {
      if (isActive) {
        _sendOrderToShop(context);
      } else {
        Provider.of<NavigationProvider>(context, listen: false)
            .navigateToLogin(context);
      }
    });
  }

  void removeProduct(CartItem item) {
    _cart.removeProduct(item: item);
    _notifyChange();
  }

  void _sendOrderToShop(BuildContext context) {
    ProfileModel profile = Provider.of<HelpersProvider>(context, listen: false)
        .authHelper
        .getProfile();

    profile.selfValidate().then((value) {
      IOrder order = _cart.placeOrder();
      final Address address = profile.getAddress();
      final LatLng coordinates = address.getCoordinates();
      Map<String, dynamic> orderJson = {
        "items": order.formatOnlineOrder(),
        "latitude": coordinates.latitude,
        "longitude": coordinates.longitude,
        "address": address.getAddress(),
        "fullName": profile.getFullName(),
        "phoneNumber": profile.getPhoneNumber(),
        "email": profile.getEmail(),
        "time": _getTimeStamp()
      };

      Provider.of<NavigationProvider>(context, listen: false)
          .navigateToDeliveryAddressScreen(context, () {
        _orderService.sendOrderToShop(
            orderJson, _authenticationService.getId());
        _cart.clearCart();
        _notifyChange();
      }, replace: false);
    });
  }

  String getTotalPrice() {
    return _cart.getTotalPrice().toStringAsFixed(2);
  }

  String _getTimeStamp() {
    DateTime now = DateTime.now();
    return '${now.hour} : ${now.minute}';
  }
}
