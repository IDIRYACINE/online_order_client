import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:online_order_client/Ui/Components/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);

    HelpersProvider helpersProvider = Provider.of<HelpersProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "THe House restaurante",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: "Lobster",
            ),
          ),
          backgroundColor: parseColor("#FCD5CE"),
          centerTitle: false,
          leading: IconButton(
              onPressed: () {
                helpersProvider.authHelper.isLoggedIn(context);
              },
              icon: const Icon(Icons.person)),
          actions: [
            IconButton(
                onPressed: () {
                  navigationProvider.navigateToStatusScreen(context);
                },
                icon: const Icon(Icons.delivery_dining_outlined)),
            IconButton(
                onPressed: () {
                  helpersProvider.authHelper.logout();
                  sendCodeAlert(context, "you have been disconnected");
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
        body: navigationProvider.getScreen(),
        bottomNavigationBar: const BottomNavBar());
  }
}
