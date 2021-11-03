import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_order_client/Ui/shared/Components.dart';
import 'package:online_order_client/Models/catalogue_model.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CatalogueState();
}

class _CatalogueState extends State<CatalogueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Mi Amore Restaurante",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black,
            fontFamily: 'Dancing',
          ),
          ),
          centerTitle: true,
        ),
        body: 
        Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/food.png'),
            fit: BoxFit.cover,
          ),
        ),
          child: Column(
            children:[
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text("Categories",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontStyle:FontStyle.italic,
                  color: Colors.red,
                  fontFamily: 'Fruktur',
                ))
                ),
              SizedBox(
                height: 40,
              ),
          defaultbutton(CategorieID:1, function: (){ print("algeria");}),
          SizedBox(
            height: 20,
          ),
          defaultbutton(CategorieID:2, function: (){ print("algeria");}),
          SizedBox(
            height: 20,
          ),
          defaultbutton(CategorieID: 3, function: (){ print("algeria");}),
          SizedBox(
            height: 20,
          ),
          defaultbutton(CategorieID: 5, function: (){ print("algeria");}),
            ]
            ),
        ),
    );
  }
}
