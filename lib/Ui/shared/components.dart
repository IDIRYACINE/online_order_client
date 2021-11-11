import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  late final Color _color;
  late final double _width;
  late final double _height;
  late final double _raduis;
  late final String _title;

  DefaultButton(
      {Key? key,
      Color? color = Colors.red,
      double? width = double.infinity,
      double? height = 70,
      double? raduis = 0,
      required String title,
      required Function? function})
      : super(key: key) {
    _color = color!;
    _width = width!;
    _height = height!;
    _raduis = raduis!;
    _title = title;
  }

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  late Function _function;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget._raduis),
        color: widget._color,
      ),
      width: widget._width,
      height: widget._height,
      child: MaterialButton(
        onPressed: () {
          _function;
        },
        child: Text(
          widget._title,
          style: const TextStyle(
              fontSize: 40, fontFamily: 'Dancing', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
