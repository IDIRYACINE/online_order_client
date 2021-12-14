import 'package:flutter/widgets.dart';
import 'package:online_order_client/Ui/Catalogue/category_screen.dart';
import 'package:online_order_client/Ui/Orders/CartScreen.dart';

class NavigationProvider with ChangeNotifier {
  final List<Widget> _screens = const [CartScreen(), CategoryScreen()];

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

  void navigateToFavorites() {}
  void navigateToProfile() {}
  void navigateToSettings() {}

  int getScreenIndex() {
    return _screenIndex;
  }
}
