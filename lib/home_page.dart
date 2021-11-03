import 'package:flutter/material.dart';
import 'package:online_order_client/Utility/Navigation/navigation_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NavigationModel navigationModel = Provider.of<NavigationModel>(context);

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
