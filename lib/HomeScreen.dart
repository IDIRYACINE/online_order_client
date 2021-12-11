import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/shared/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
        ),
        child: Container(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => const CategoryLIstView(),
            separatorBuilder: (context, index) => Divider(
              color: parseColor("#F9DCC4"),
              height: 10,
              thickness: 5,
            ),
            itemCount: 4,
          ),
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
              label: 'hile',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
                iconSize: 40,
              ),
              label: 'hile',
            ),
            BottomNavigationBarItem(
                icon: IconButton(onPressed: () {}, icon: CartIcon(0)),
                label: 'hile'),
          ]),
    );
  }
}
