import 'package:online_order_client/Application/Authentication/authentication.dart';
import 'package:online_order_client/Ui/Catalogue/category_screen.dart';
import 'package:online_order_client/Ui/Login/login_screen.dart';
import 'package:online_order_client/Ui/Login/new_accoun_screen.dart';
import 'package:online_order_client/Ui/Cart/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../Ui/DelivrationInformations/gps_screen.dart';

class NavigationProvider with ChangeNotifier {
  final List<Widget> _screens = const [CartScreen(), CategoryScreen()];

  final Authentication _authentication = Authentication();

  int _screenIndex = 0;

  NavigationProvider();

  Widget getScreen() => _screens[_screenIndex];

  void navigateToCart() {
    _screenIndex = 0;
    notifyListeners();
  }

  void navigateToCatalogue() {
    _screenIndex = 1;
    notifyListeners();
  }

  void navigateToCategoryproductsScreen() {
    _screenIndex = 2;
    notifyListeners();
  }

  void navigateToProfile() {}
  void navigateToSettings() {}

  void navigateToLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void navigateToGpsScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DeliveryAddresScreen()));
  }

  void navigateToNewAccount(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewAccountScreen(_authentication)));
  }

  int getScreenIndex() {
    return _screenIndex;
  }
}
