import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Navigation/navigation_provider.dart';
import 'package:online_order_client/Ui/shared/Components.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
        backgroundColor: parseColor("#FCD5CE"),
        iconSize: 10,
        currentIndex: navigationProvider.getScreenIndex(),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                navigationProvider.navigateToCatalogue();
              },
              icon: const Icon(
                Icons.keyboard_return,
              ),
            ),
            label: 'Return',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.home),
              iconSize: 40,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    navigationProvider.navigateToCart();
                  },
                  icon: CartIcon(0)),
              label: 'Cart'),
        ]);
  }
}
