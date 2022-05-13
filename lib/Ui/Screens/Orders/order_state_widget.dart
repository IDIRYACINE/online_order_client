import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Orders/order_status_helper.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class OrderStateWidget extends StatefulWidget {
  final String state;
  final String title;
  final String? description;
  final Color? activeColor;
  final Color? unactiveColor;
  final bool showExtension;
  final double verticalDividerThickness = 5.0;
  final double verticalDividerHeight = 150;

  const OrderStateWidget({
    Key? key,
    required this.title,
    required this.state,
    this.description,
    this.activeColor,
    this.showExtension = true,
    this.unactiveColor,
  }) : super(key: key);

  @override
  State<OrderStateWidget> createState() => _OrderStateWidgetState();
}

class _OrderStateWidgetState extends State<OrderStateWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Color activeColor = widget.activeColor ?? theme.colorScheme.primary;
    Color unactiveColor = widget.unactiveColor ?? theme.colorScheme.secondary;
    return Consumer<OrderStatusProvider>(builder: (context, helper, child) {
      bool state = helper.calculateOrderActiveState(widget.state);
      Color color = state ? activeColor : unactiveColor;

      return Row(children: [
        Flexible(
          child: Column(
            children: [
              CircleAvatar(backgroundColor: color),
              if (widget.showExtension)
                SizedBox(
                  height: widget.verticalDividerHeight,
                  child: VerticalDivider(
                    color: state ? activeColor : unactiveColor,
                    thickness: widget.verticalDividerThickness,
                  ),
                ),
            ],
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: textSizeMeduim,
                  color: color,
                  fontWeight: FontWeight.bold),
            ),
            if (widget.description != null)
              Text(
                widget.description!,
                style: theme.textTheme.subtitle2,
              )
          ],
        ))
      ]);
    });
  }
}
