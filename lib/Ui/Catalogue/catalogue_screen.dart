import 'package:flutter/material.dart';
import 'package:online_order_client/Application/catalogue.dart';
import 'package:online_order_client/Ui/shared/components.dart';
import 'package:online_order_client/Ui/Catalogue/CategoryProductsScreen.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CatalogueState();
}

class _CatalogueState extends State<CatalogueScreen> {
  final Catalogue _catalogue = Catalogue();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Mi Amore Restaurante",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black,
            fontFamily: 'Dancing',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/food.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Container(
              alignment: Alignment.bottomCenter,
              child: const Text("Categories",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                    fontFamily: 'Fruktur',
                  ))),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (buildContext, index) => DefaultButton(
                    title: _catalogue.getCategory(index).getName(),
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryproductsScreen()));
                    }),
                separatorBuilder: (buildContext, index) =>
                    const SizedBox(height: 20),
                itemCount: _catalogue.getCategoriesCount()),
          )
        ]),
      ),
    );
  }
}
