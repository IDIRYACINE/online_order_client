import 'package:flutter/widgets.dart';

class NavigationProvider with ChangeNotifier {
  final List<Widget> _screens = [];
  int _screenIndex = 0;
  NavigationProvider();

  Widget getScreen() => _screens[_screenIndex];
  void setScreenIndex(int screenID) {
    _screenIndex = screenID;
    notifyListeners();
  }
}
