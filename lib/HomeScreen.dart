import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Navigation/navigation_provider.dart';
import 'package:online_order_client/Ui/shared/Components.dart';
import 'package:online_order_client/Ui/shared/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);

    return Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: const Text(
            "THe House restaurante",
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: parseColor("#FCD5CE"),
          centerTitle: false,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
          ],
        ),
        body: navigationProvider.getScreen(),
        bottomNavigationBar: const BottomNavBar());
  }
}
