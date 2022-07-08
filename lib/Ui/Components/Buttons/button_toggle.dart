import 'package:flutter/material.dart';

typedef ToggleCallback = void Function(bool value);

class ToggleButton extends StatefulWidget {
  final IconData showTextIcon;
  final IconData hideTextIcon;
  final ToggleCallback? toggleCallback;
  final bool isActive;
  const ToggleButton(
      {Key? key,
      this.showTextIcon = Icons.visibility,
      this.hideTextIcon = Icons.visibility_off,
      this.toggleCallback,
      this.isActive = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  late bool isActive;

  @override
  Widget build(BuildContext context) {
    isActive = widget.isActive;

    return InkResponse(
        onTap: () {
          setState(() {
            isActive = !isActive;
          });
          if (widget.toggleCallback != null) {
            widget.toggleCallback!(isActive);
          }
        },
        child: Icon(isActive ? widget.hideTextIcon : widget.showTextIcon));
  }
}
