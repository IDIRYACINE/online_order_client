import 'package:flutter/widgets.dart';
import 'package:online_order_client/Application/orders.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetailsScreen> {
  final OrdersModel _ordersModel = OrdersModel();

  _OrderDetailsState() {
    _ordersModel.subscribeToOrderStatusChange(callback: _rebuild);
  }
  void _rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(_ordersModel.getOrderId),
        Text(_ordersModel.getOrderStatus)
      ],
    );
  }
}
