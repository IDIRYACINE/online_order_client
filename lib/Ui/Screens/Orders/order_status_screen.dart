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
            description:
                "Here you can track your order status (Confirmed or Refused)",
          ),
          SizedBox(
            child: VerticalDivider(
              color: Colors.black,
              thickness: 5.0,
            ),
            height: 150,
          ),
          OrderStateWidget(
              state: OrderStatus.confirmed,
              title: OrderStatus.confirmed,
              description: "Here you can check your Food status"),
          SizedBox(
            child: VerticalDivider(
              color: Colors.black,
              thickness: 5.0,
            ),
            height: 150,
          ),
          OrderStateWidget(
              state: OrderStatus.onDelivery,
              title: OrderStatus.onDelivery,
              description: "Here you can check your order Deliveration status"),
        ],
      ),
    );
  }
}
