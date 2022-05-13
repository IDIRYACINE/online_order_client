import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Orders/order_status.dart';
import 'package:online_order_client/Ui/Screens/Orders/order_state_widget.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          OrderStateWidget(
            state: OrderStatus.waiting,
            title: OrderStatus.waiting,
          ),
          OrderStateWidget(
            state: OrderStatus.confirmed,
            title: OrderStatus.confirmed,
          ),
          OrderStateWidget(
            state: OrderStatus.onDelivery,
            title: OrderStatus.onDelivery,
          ),
        ],
      ),
    );
  }
}
