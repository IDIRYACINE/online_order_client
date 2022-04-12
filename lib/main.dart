import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Orders/Controller.dart';
import 'package:online_order_client/Ui/Orders/ControllerBindings.dart';
import 'package:online_order_client/home_screen.dart';
//import 'package:online_order_client/Ui/Catalogue/catalogue_screen.dart';
//import 'package:online_order_client/test.dart';
import 'package:provider/provider.dart';

void main() {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'test_channel',
      channelName: 'test notification',
      channelDescription: "nottfication for basic testig"
    )

  ]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NavigationProvider()),
    ChangeNotifierProvider(create: (_) => HelpersProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HelpersProvider _catalogue = Provider.of<HelpersProvider>(context);
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
        home: FutureBuilder(
      future: _catalogue.initApp(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        }
        if (snapshot.hasError) {
          print(snapshot.error);
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
}class Root extends StatelessWidget {
  const Root({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      
    );
  }
}
