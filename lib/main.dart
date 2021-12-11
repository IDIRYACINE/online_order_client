import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Navigation/navigation_provider.dart';
import 'package:online_order_client/Domain/Catalogue/catalogue_model.dart';
import 'package:online_order_client/HomeScreen.dart';
//import 'package:online_order_client/Ui/Catalogue/catalogue_screen.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';
//import 'package:online_order_client/test.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NavigationProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> _initApp() async {
    await Firebase.initializeApp();
    ServicesProvider services = ServicesProvider();
    await services.initialiaze();
    await services.productDatabase.connect();
    await CatalogueModel().initCategories();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
      future: _initApp(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        }
        if (snapshot.hasError) {
          print(snapshot.stackTrace);
          return const Text('error');
        } else {
          return const SplashScreen();
        }
      },
    ));
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text(
                'Shop',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator()
            ],
          ),
        ));
  }
}
