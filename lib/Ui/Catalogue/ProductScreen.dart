import 'package:flutter/material.dart';
import 'package:online_order_client/HomeScreen.dart';
import 'package:online_order_client/Ui/Favorites/FavoritesScreen.dart';
import 'package:online_order_client/Ui/Orders/CartScreen.dart';
import 'package:online_order_client/Ui/Profile/profile_screen.dart';
import 'package:online_order_client/Ui/Settings/settings_screen.dart';
import 'package:online_order_client/Ui/shared/Components.dart';



class CategoryproductsScreen extends StatefulWidget {
  const CategoryproductsScreen({Key? key}) : super(key: key);
  @override
  _CategoryproductsScreenState createState() => _CategoryproductsScreenState();
}

class _CategoryproductsScreenState extends State<CategoryproductsScreen> {
  int count = 0;
  int Unities = 0;
  int currentindex = 0;
  @override
  void initState() {
    super.initState();
  }

  Future<void> ProductOrderDetail(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red[50],
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Form(
                child: Container(
              alignment: Alignment.bottomCenter,
              height: 200,
              width: double.infinity,
              child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Text(
                              "Hrissa",
                              style: TextStyle(fontSize: 26,
                              fontFamily: "Lobster"
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.check_circle,
                                    color: Colors.green)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Mayounez",
                              style: TextStyle(fontSize: 23,
                              fontFamily: "Lobster"
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.check_circle,
                                    color: Colors.green)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Unities",
                              style: TextStyle(fontSize: 26,
                              fontFamily: "Lobster"
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (Unities <= 0) {
                                      Unities == 0;
                                    } else {
                                      Unities--;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove_circle,
                               //   color: Colors.red,
                                ),
                                mini: true,
                                heroTag: 'Unit--',
                                 backgroundColor: Colors.red[50],
                                foregroundColor: parseColor("#FFB5A7"),
                                ),
                            Text("$Unities"),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    Unities++;
                                  });
                                },
                                child: Icon(
                                  Icons.add_circle,
                                ),
                                mini: true,
                                heroTag: 'Unit++',
                                foregroundColor: Colors.red[50],
                                backgroundColor: parseColor("#FFB5A7"),
                                ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 140,
                        height: 40,
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: parseColor("#FFB5A7"),
                            ),
                            label: Text('Confirme'),
                            icon: Icon(Icons.check),
                            onPressed: () {
                              setState(() {
                                count++;
                              });
                              Navigator.pop(context, true);
                            }),
                      ),
                    ]),
              ),
            )),
            actions: [],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: Text(
            "THe House restaurante",
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: parseColor("#FCD5CE"),
          centerTitle: false,
          leading: IconButton(onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
          }, icon: Icon(Icons.person)),
          actions: [
          IconButton(onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));

          }, icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritesScreen()));
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
                    icon: Icon(
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
                    icon: Icon(Icons.home),
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
                                  builder: (context) => CartScreen()));
                        },
                        icon: CartIcon(count)),
                    label: 'Cart'),
              ]),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElemTitle(context, "Pizza tunisian"),
              PicturesLV(),
              Divider(
                color: parseColor("#F9DCC4"),
                height: 10,
                thickness: 5,
              ),
             SizedBox(height: 20),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ProductDescription()),
              SizedBox(height: 20),
              PricesTabl(),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 180,
                  height: 60,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: parseColor("#FFB5A7"),
                    ),
                    label: Text('ADD To Cart'),
                    icon: Icon(Icons.dinner_dining_rounded),
                    onPressed: () async {
                      await ProductOrderDetail(context);
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