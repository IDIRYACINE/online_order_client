import 'package:flutter/material.dart';

class StateExample extends StatefulWidget {

  late final double _avatarSize;
  late final IconData _iconStatus;
  late final Color? _avatarColor;
  late final double _iconeSize;
  late final bool _state;
  late final IconData _iconeStatusTrue;
  late final double _iconeSizeTrue;
  late final double _avatarSizeTrue;
  late final Color _avatarColorTrue;
  late final String _title;
  late final String _description;


  StateExample(
      {Key? key,
 IconData iconStatus = Icons.access_time_outlined,
  double avatarSize = 35,
  Color? avatarColor,
  double iconeSize = 35,
   bool state = true, //as controller
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
    _state=state;
    _iconeStatusTrue=iconeStatusTrue;
    _iconeSizeTrue=iconeSizeTrue;
    _avatarSizeTrue=avatarSizeTrue;
    _avatarColorTrue=avatarColorTrue;
    _title=title;
    _description=description;

  }

  @override
  State<StateExample> createState() => _StateExampleState();
}

class _StateExampleState extends State<StateExample> {
  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                CircleAvatar(
                  child: Icon(
                    widget._state ? widget._iconeStatusTrue : widget._iconStatus,
                    size: widget._state ? widget._iconeSizeTrue : widget._iconeSize,
                  ),
                  radius: widget._state ? widget._avatarSizeTrue : widget._avatarSize,
                  backgroundColor: widget._state ? widget._avatarColorTrue : widget._avatarColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children:  [
                    Tooltip(
                      message:
                          widget._description,
                      child: Text(
                        widget._title
                       ,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            );
  }
}
