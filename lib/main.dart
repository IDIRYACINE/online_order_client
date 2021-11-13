import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Catalogue/catalogue_screen.dart';
import 'package:online_order_client/Ui/GpsLocation/deliveryaddres_screen.dart';
import 'package:online_order_client/Ui/Orders/order_status_screen.dart';
import 'package:online_order_client/Utility/Authentication/authentication_service.dart';
import 'package:online_order_client/Utility/Navigation/navigation_model.dart';
import 'package:online_order_client/test.dart';
import 'package:provider/provider.dart';

import 'Models/Catalogue/catalogue_model.dart';
import 'Utility/Database/products_database.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NavigationModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> _initApp() async {
    const String localHost = "192.168.1.9";
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore fire = FirebaseFirestore.instance;
    fire.useFirestoreEmulator(localHost, 8080);
    auth.useAuthEmulator(localHost, 9099);
    FirebaseAuthenticationService().initialize(auth, fire);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
      future: _initApp(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return TestWidget();
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
