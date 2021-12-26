import 'package:online_order_client/Application/authentication.dart';
import 'package:online_order_client/Ui/Catalogue/category_screen.dart';
import 'package:online_order_client/Ui/Login/LoginScreen.dart';
import 'package:online_order_client/Ui/Login/NewAccounScreen.dart';
import 'package:online_order_client/Ui/Orders/CartScreen.dart';
import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  final List<Widget> _screens = const [
    CartScreen(),
    CategoryScreen(),
  ];
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

  void navigateToFavorites() {}
  void navigateToProfile() {}
  void navigateToSettings() {}
  void navigateToLogin(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LoginScreen(_authentication)));
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
