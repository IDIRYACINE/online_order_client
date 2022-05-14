import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';

class OrderStateWidget extends StatefulWidget {
  final String state;
  final String title;
  final String? description;
  final Color? activeColor;
  final Color? unactiveColor;
  final bool showExtension;
  final double verticalDividerThickness = 5.0;
  final double verticalDividerHeight = 150;
  final bool activeState;

  const OrderStateWidget({
    Key? key,
    required this.title,
    required this.state,
    this.description,
    this.activeColor,
    this.showExtension = true,
    this.unactiveColor,
    required this.activeState,
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
    Color color = widget.activeState ? activeColor : unactiveColor;

    return Row(children: [
      Flexible(
        child: Column(
          children: [
            CircleAvatar(backgroundColor: color),
            if (widget.showExtension)
              SizedBox(
                height: widget.verticalDividerHeight,
                child: VerticalDivider(
                  color: color,
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
  }
}
