import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
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
        currentIndex: navigationProvider.getIconIndex(),
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
                setState(() {
                  navigationProvider.navigateToCatalogue();
                });
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
                icon: Stack(children: [
                  const Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                  Positioned(
                    bottom: 13,
                    left: 9,
                    child: Container(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          child: Consumer<HelpersProvider>(
                              builder: (context, helpers, child) {
                            return Text(
                              "${helpers.cartHelper.getCartItemCount()}",
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 10),
                            );
                          }),
                          radius: 7,
                          backgroundColor: Colors.red,
                        )),
                  ),
                ]),
              ),
              label: 'Cart')
        ]);
  }
}
