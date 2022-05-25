import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_client/Application/Orders/order_status_helper.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/dialogs.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:online_order_client/Ui/Themes/main_theme.dart';
import 'package:online_order_client/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NavigationProvider()),
    ChangeNotifierProvider(create: (_) => HelpersProvider()),
    ChangeNotifierProvider(create: (_) => OrderStatusProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HelpersProvider _helpers = Provider.of<HelpersProvider>(context);
    return GetMaterialApp(
        theme: primaryTheme,
        home: FutureBuilder(
          future: _helpers.initApp(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            if (snapshot.hasError) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const ErrorAlertDialog(labelError);
                  });
              return const SplashScreen();
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
                shopLabel,
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
        ));
  }
}
