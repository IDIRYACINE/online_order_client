import 'package:flutter/material.dart';
import 'package:online_order_client/HomeScreen.dart';
import 'package:online_order_client/Ui/Catalogue/ProductScreen.dart';
import 'package:online_order_client/Ui/shared/Components.dart';


class CartScreen extends StatefulWidget {

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
    int count = 0;
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
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
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
                    icon: IconButton(onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }, icon: CartIcon(count)),
                    label: 'Cart'),
              ]),
        ),
        body: Container(
          child: CartItem(),
        ),
    );
  }
}