import 'package:flutter/material.dart';
import 'package:online_order_client/home_screen.dart';
import 'package:online_order_client/Ui/Profile/profile_screen.dart';
import 'package:online_order_client/Ui/Components/components.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
            icon: const Icon(Icons.person)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
            backgroundColor: parseColor("#FCD5CE"),
            iconSize: 10,
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_return,
                  ),
                ),
                label: 'return',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  icon: const Icon(Icons.home),
                  iconSize: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      icon: cartIcon(5)),
                  label: 'Cart'),
            ]),
      ),
    );
  }
}
