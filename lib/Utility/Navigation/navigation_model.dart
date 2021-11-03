import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class NavigationModel with ChangeNotifier {
  final List<Widget> _screens = [];
  int _screenIndex = 0;
  NavigationModel();

  Widget getScreen() => _screens[_screenIndex];
  void setScreenIndex(int screenID) {
    _screenIndex = screenID;
    notifyListeners();
  }
}
