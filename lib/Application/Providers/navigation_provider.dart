import 'package:online_order_client/Application/Authentication/user_input_validator.dart';
import 'package:online_order_client/Ui/Catalogue/category_screen.dart';
import 'package:online_order_client/Ui/Catalogue/product_screen.dart';
import 'package:online_order_client/Ui/Login/login_screen.dart';
import 'package:online_order_client/Ui/Login/new_account_screen.dart';
import 'package:online_order_client/Ui/Cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Profile/profile_screen.dart';

import '../../Ui/DeliveryAddresse/gps_screen.dart';

class NavigationProvider with ChangeNotifier {
  final List<Widget> _screens = const [
    CartScreen(),
    CategoryScreen(),
    ProfileScreen()
  ];

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

  void navigateToProfileScreen() {
    _screenIndex = 3;
    notifyListeners();
  }

  void navigateToSettings() {}

  void navigateToLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
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
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewAccountScreen(UserInputValidtor())));
  }

  void navigateToProfile(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()));
  }

  int getScreenIndex() {
    return _screenIndex;
  }
}
