import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Orders/order_status.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:online_order_client/Ui/Screens/Orders/status_widget.dart';

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
        children: [
          StatusWidget(
            state: (OrderStatus.waiting),
            title: "Order State",
            description:
                "Here you can track your order status (Confirmed or Refused)",
          ),
          const SizedBox(
            child: VerticalDivider(
              color: Colors.black,
              thickness: 5.0,
            ),
            height: 150,
          ),
          StatusWidget(
              state: (OrderStatus.confirmed),
              title: "Food State",
              description: "Here you can check your Food status"),
          const SizedBox(
            child: VerticalDivider(
              color: Colors.black,
              thickness: 5.0,
            ),
            height: 150,
          ),
          StatusWidget(
              state: (OrderStatus.onDelivery),
              title: "Delivery State",
              description: "Here you can check your order Deliveration status"),
        ],
      ),
    );
  }
}
