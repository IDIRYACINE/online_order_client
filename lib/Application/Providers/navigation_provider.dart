import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/catalogue_all_screen.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/catalogue_screen.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/category_screen.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/Product/product_screen.dart';
import 'package:online_order_client/Ui/Screens/DeliveryAddress/gps_screen.dart';
import 'package:online_order_client/Ui/Screens/Login/login_screen.dart';
import 'package:online_order_client/Ui/Screens/Login/new_account_screen.dart';
import 'package:online_order_client/Ui/Screens/Cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Screens/Orders/order_status_screen.dart';
import 'package:online_order_client/Ui/Screens/Profile/profile_screen.dart';

class NavigationProvider with ChangeNotifier {
  final List<Widget> _screens = [
    const CartScreen(),
    const CatalogueScreen(),
    const StatusScreen()
  ];

  int _screenIndex = 1;
  int _iconIndex = 0;

  NavigationProvider();

  Widget getScreen() => _screens[_screenIndex];

  void navigateToCart() {
    _screenIndex = 0;
    _iconIndex = 2;
    notifyListeners();
  }

  void navigateToCatalogue() {
    _screenIndex = 1;
    _iconIndex = 0;
    notifyListeners();
  }

  void navigateToStatusScreen() {
    _screenIndex = 2;
    _iconIndex = 1;
    notifyListeners();
  }

  void navigateToSettings() {}

  void navigateToLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void navigateToStatus(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const StatusScreen()));
  }

  void navigateToDeliveryAddressScreen(
      BuildContext context, VoidCallback callback,
      {required bool replace}) {
    if (!replace) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DeliveryAddresScreen(callback)));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => DeliveryAddresScreen(callback)));
    }
  }

  void navigateToNewAccount(BuildContext context, {bool replace = false}) {
    if (!replace) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NewAccountScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const NewAccountScreen()));
    }
  }

  void navigateToProfile(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()));
  }

  void navigateToCategory(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CategoryScreen()));
  }

  void navigateToProductDetails(BuildContext context, CartItem cartItem) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductsScreen(cartItem)));
  }

  int getScreenIndex() {
    return _screenIndex;
  }

  int getIconIndex() {
    return _iconIndex;
  }

  void navigateToAllCategories(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CatalogueAllScreen()));
  }
}
