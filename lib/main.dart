import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_order_client/Models/catalogue_model.dart';
import 'package:online_order_client/Ui/Catalogue/catalogue_screen.dart';
import 'package:online_order_client/Utility/Database/products_database.dart';
import 'package:online_order_client/Utility/Navigation/navigation_model.dart';
import 'package:online_order_client/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NavigationModel()),
    ChangeNotifierProvider(create: (_) => CatalogueModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> _initApp() async {
    await Firebase.initializeApp();
    ProductsDatabase();
    await Future.delayed(const Duration(seconds: 5));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
      future: _initApp(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return const CatalogueScreen();
        }
        if (snapshot.hasError) {
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
