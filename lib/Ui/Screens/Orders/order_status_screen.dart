import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Orders/order_status_helper.dart';
import 'package:online_order_client/Domain/Orders/order_status.dart';
import 'package:online_order_client/Ui/Screens/Orders/order_state_widget.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Provider.of<OrderStatusProvider>(context).subscribeToOrderStatusStream();

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<OrderStatusProvider>(builder: (context, helper, child) {
          if (!helper.orderExists()) {
            return Center(
                child: Text(labelNoOrder, style: theme.textTheme.headline2));
          }

          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OrderStateWidget(
                state: OrderStatus.waiting,
                title: OrderStatus.waitingTitle,
                activeState:
                    helper.calculateOrderActiveState(OrderStatus.waiting),
              ),
              OrderStateWidget(
                state: OrderStatus.confirmed,
                title: OrderStatus.confirmedTitle,
                activeState:
                    helper.calculateOrderActiveState(OrderStatus.confirmed),
              ),
              OrderStateWidget(
                state: OrderStatus.onDelivery,
                title: OrderStatus.onDeliveryTitle,
                activeState:
                    helper.calculateOrderActiveState(OrderStatus.onDelivery),
              ),
            ],
          );
        }));
  }
}
