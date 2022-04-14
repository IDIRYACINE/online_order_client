import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:online_order_client/Ui/Orders/Stat_Example.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  static bool state = false; //as controller
//
  static bool state2 = true; //as controller
//
  static bool state3 = false; //as controller

  @override
  Widget build(BuildContext context) {
    if (state == false) {
      state2 = false;
    }
    if (state2 == false) {
      state3 = false;
    }
    return Scaffold(
      backgroundColor: parseColor("#F8EDEB"),
      appBar: AppBar(
        title: const Text(
          "order status",
          style: TextStyle(
            fontSize: 16.5,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: parseColor("#FCD5CE"),
        centerTitle: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context, false),
            icon: const Icon(Icons.keyboard_return)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StateExample(state: state, avatarColor: parseColor("#FCD5CE"),title: "Order State",description: "Here you can track your order status (Confirmed or Refused)",),
            const SizedBox(
              child: VerticalDivider(
                color: Colors.black,
                thickness: 5.0,
              ),
              height: 150,
            ),
             StateExample(state: state2, avatarColor: parseColor("#FCD5CE"),title: "Food State",description: "Here you can check your Food status"),
            const SizedBox(
              child: VerticalDivider(
                color: Colors.black,
                thickness: 5.0,
              ),
              height: 150,
            ),
             StateExample(state: state3, avatarColor: parseColor("#FCD5CE"),title: "Delivery State",description: "Here you can check your order Deliveration status"),
          ],
        ),
      ),
    );
  }
}
