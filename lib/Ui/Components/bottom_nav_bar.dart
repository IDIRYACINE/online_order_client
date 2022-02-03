import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Application/Providers/catalogue_provider.dart';
import 'package:online_order_client/Ui/Components/components.dart';
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

    CatalogueProvider catalogueProvider =
        Provider.of<CatalogueProvider>(context);

    return BottomNavigationBar(
        backgroundColor: parseColor("#FCD5CE"),
        iconSize: 10,
        currentIndex: navigationProvider.getScreenIndex(),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pop(context);
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
                navigationProvider.navigateToCatalogue();
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
                  icon: cartIcon(
                      catalogueProvider.cartHelper.getCartItemCount())),
              label: 'Cart'),
        ]);
  }
}
