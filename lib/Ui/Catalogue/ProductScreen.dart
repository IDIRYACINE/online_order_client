import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Cart/cart.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/HomeScreen.dart';
import 'package:online_order_client/Ui/Catalogue/product_units_popup.dart';
import 'package:online_order_client/Ui/Favorites/FavoritesScreen.dart';
import 'package:online_order_client/Ui/Orders/CartScreen.dart';
import 'package:online_order_client/Ui/Profile/profile_screen.dart';
import 'package:online_order_client/Ui/Settings/settings_screen.dart';
import 'package:online_order_client/Ui/shared/Components.dart';

class CategoryproductsScreen extends StatefulWidget {
  final Product _product;
  const CategoryproductsScreen(this._product, {Key? key}) : super(key: key);

  @override
  _CategoryproductsScreenState createState() => _CategoryproductsScreenState();
}

class _CategoryproductsScreenState extends State<CategoryproductsScreen> {
  int currentindex = 0;
  int count = 0;
  final Cart cart = Cart();

  @override
  void initState() {
    super.initState();
  }

  Future<void> displayProductUnitsPoupUp(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red[50],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: ProductUnitsPopUp(widget._product, parseColor("#FFB5A7")),
          );
        });
  }

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoritesScreen()));
                },
                icon: const Icon(Icons.favorite)),
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
                              builder: (context) => HomeScreen()));
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
                                  builder: (context) => const CartScreen()));
                        },
                        icon: CartIcon(cart.getProductsCount())),
                    label: 'Cart'),
              ]),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElemTitle(context, widget._product.getName()),
              PicturesLV(widget._product),
              Divider(
                color: parseColor("#F9DCC4"),
                height: 10,
                thickness: 5,
              ),
              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ProductDescription(widget._product)),
              const SizedBox(height: 20),
              PricesTabl(widget._product),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 180,
                  height: 60,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: parseColor("#FFB5A7"),
                    ),
                    label: const Text('ADD To Cart'),
                    icon: const Icon(Icons.dinner_dining_rounded),
                    onPressed: () async {
                      await displayProductUnitsPoupUp(context);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: parseColor("#FFB5A7"),
                  ),
                  splashColor: parseColor("#FFB5A7"),
                ),
              ]),
            ],
          ),
        ));
  }
}
