import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Orders/order_status_helper.dart';
import 'package:provider/provider.dart';

class OrderStateWidget extends StatefulWidget {
  final double avatarSize;
  final IconData iconStatus;
  final Color? avatarColor;
  final double iconeSize;
  final String state;
  final IconData iconeStatusTrue;
  final double iconeSizeTrue;
  final double avatarSizeTrue;
  final Color avatarColorTrue;
  final String title;
  final String? description;

  const OrderStateWidget({
    Key? key,
    this.iconStatus = Icons.access_time_outlined,
    this.avatarSize = 35,
    this.avatarColor,
    this.iconeSize = 35,
    this.iconeStatusTrue = Icons.check,
    required this.title,
    this.avatarColorTrue = Colors.green,
    required this.state,
    this.iconeSizeTrue = 40,
    this.avatarSizeTrue = 40,
    this.description,
  }) : super(key: key);

  @override
  State<OrderStateWidget> createState() => _OrderStateWidgetState();
}

class _OrderStateWidgetState extends State<OrderStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<OrderStatusProvider>(builder: (context, helper, child) {
          bool state = helper.calculateOrderActiveState(widget.state);
          return CircleAvatar(
            child: Icon(
              state ? widget.iconeStatusTrue : widget.iconStatus,
              size: state ? widget.iconeSizeTrue : widget.iconeSize,
            ),
            radius: state ? widget.avatarSizeTrue : widget.avatarSize,
            backgroundColor:
                state ? widget.avatarColorTrue : widget.avatarColor,
          );
        }),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Tooltip(
              message: widget.description,
              child: Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}
