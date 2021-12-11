import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Catalogue/catalogue_model.dart';
import 'package:online_order_client/Ui/Favorites/FavoritesScreen.dart';
import 'package:online_order_client/Ui/Profile/profile_screen.dart';
import 'package:online_order_client/Ui/Settings/settings_screen.dart';
import 'package:online_order_client/Ui/shared/Components.dart';

import 'Ui/Orders/CartScreen.dart';

class HomeScreen extends StatelessWidget {
  final CatalogueModel _catalogueModel = CatalogueModel();

  HomeScreen({Key? key}) : super(key: key);

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
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritesScreen()));
              },
              icon: const Icon(Icons.favorite)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
        ),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return CategoryWidget(
                _catalogueModel.getCategory(categoryIndex: index));
          },
          separatorBuilder: (context, index) => Divider(
            color: parseColor("#F9DCC4"),
            height: 10,
            thickness: 5,
          ),
          itemCount: _catalogueModel.getCategoriesCount(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
                onPressed: () {},
                icon: const Icon(Icons.home),
                iconSize: 40,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                    },
                    icon: CartIcon(0)),
                label: 'Cart'),
          ]),
    );
  }
}
