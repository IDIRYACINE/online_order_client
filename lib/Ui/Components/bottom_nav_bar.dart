import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
        iconSize: 40,
        selectedItemColor: theme.primaryColor,
        currentIndex: navigationProvider.getIconIndex(),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                navigationProvider.navigateToCatalogue();
              },
              icon: const Icon(Icons.home),
            ),
            label: bottomNavBarHome,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                navigationProvider.navigateToStatusScreen();
              },
              icon: const Icon(Icons.notifications),
            ),
            label: bottomNavBarOrders,
          ),
          BottomNavigationBarItem(
            label: bottomNavBarCart,
            icon: IconButton(
              onPressed: () {
                navigationProvider.navigateToCart();
              },
              icon: Stack(children: [
                const Icon(
                  Icons.shopping_cart,
                ),
                Positioned(
                  child: Container(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        child: Consumer<HelpersProvider>(
                            builder: (context, helpers, child) {
                          return Text(
                            "${helpers.cartHelper.getCartItemCount()}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          );
                        }),
                        radius: 7,
                        backgroundColor: Colors.red,
                      )),
                ),
              ]),
            ),
          )
        ]);
  }
}
