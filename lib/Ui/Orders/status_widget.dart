import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Orders/order_status_helper.dart';
import 'package:provider/provider.dart';

class StatusWidget extends StatefulWidget {
  late final double _avatarSize;
  late final IconData _iconStatus;
  late final Color? _avatarColor;
  late final double _iconeSize;
  late final String _state;
  late final IconData _iconeStatusTrue;
  late final double _iconeSizeTrue;
  late final double _avatarSizeTrue;
  late final Color _avatarColorTrue;
  late final String _title;
  late final String _description;

  StatusWidget(
      {Key? key,
      IconData iconStatus = Icons.access_time_outlined,
      double avatarSize = 35,
      Color? avatarColor,
      double iconeSize = 35,
      required String state,
      IconData iconeStatusTrue = Icons.check,
      double iconeSizeTrue = 40,
      double avatarSizeTrue = 40,
      required String title,
      required String description,
      Color avatarColorTrue = Colors.green})
      : super(key: key) {
    _avatarSize = avatarSize;
    _iconStatus = iconStatus;
    _avatarColor = avatarColor;
    _iconeSize = iconeSize;
    _state = state;
    _iconeStatusTrue = iconeStatusTrue;
    _iconeSizeTrue = iconeSizeTrue;
    _avatarSizeTrue = avatarSizeTrue;
    _avatarColorTrue = avatarColorTrue;
    _title = title;
    _description = description;
  }

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<OrderStatusProvider>(builder: (context, helper, child) {
          bool state = helper.calculateOrderActiveState(widget._state);
          return CircleAvatar(
            child: Icon(
              state ? widget._iconeStatusTrue : widget._iconStatus,
              size: state ? widget._iconeSizeTrue : widget._iconeSize,
            ),
            radius: state ? widget._avatarSizeTrue : widget._avatarSize,
            backgroundColor:
                state ? widget._avatarColorTrue : widget._avatarColor,
          );
        }),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Tooltip(
              message: widget._description,
              child: Text(
                widget._title,
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
