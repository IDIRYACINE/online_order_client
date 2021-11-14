import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Navigation/navigation_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NavigationProvider navigationModel =
        Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: const Center(child: Text('')),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety_sharp), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        onTap: navigationModel.setScreenIndex,
      ),
    );
  }
}
