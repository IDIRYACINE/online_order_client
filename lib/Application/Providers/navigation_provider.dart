import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Ui/Catalogue/category_screen.dart';
import 'package:online_order_client/Ui/Catalogue/product_screen.dart';
import 'package:online_order_client/Ui/Login/login_screen.dart';
import 'package:online_order_client/Ui/Login/new_account_screen.dart';
import 'package:online_order_client/Ui/Cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Profile/profile_screen.dart';

import '../../Ui/DeliveryAddresse/gps_screen.dart';
import '../../Ui/Orders/order_status_screen.dart';

class NavigationProvider with ChangeNotifier {
  final List<Widget> _screens = [
    const CartScreen(),
    const CategoryScreen(),
  ];

  int _screenIndex = 0;
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
    _iconIndex = 1;
    notifyListeners();
  }

  void navigateToCategoryProductsScreen() {
    _screenIndex = 2;
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

  void navigateToNewAccount(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NewAccountScreen()));
  }

  void navigateToProfile(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()));
  }

  void navigateToProductDetails(BuildContext context, Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryproductsScreen(product)));
  }

  void navigateToStatusScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const StatusScreen()));
  }

  int getScreenIndex() {
    return _screenIndex;
  }

  int getIconIndex() {
    return _iconIndex;
  }
}
