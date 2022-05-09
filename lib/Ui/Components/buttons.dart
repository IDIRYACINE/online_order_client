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

typedef CounterCallback = void Function(int count);

class UnitButton extends StatefulWidget {
  final double borderRadius;
  final bool fillBackground;
  final int initialCount;
  final CounterCallback onCountChange;

  const UnitButton(
      {Key? key,
      this.borderRadius = 12.0,
      this.fillBackground = false,
      this.initialCount = 0,
      required this.onCountChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _UnitButtonState();
}

class _UnitButtonState extends State<UnitButton> {
  late int _units;
  late Color _backgroundColor;
  late Color _iconBackgroundColor;
  late Color _iconColor;
  late TextStyle _counterTextStyle;

  _UnitButtonState() {
    _units = 1;
  }

  void _increameant(int step) {
    int temp = _units + step;
    if (temp > widget.initialCount) {
      widget.onCountChange(temp);
      setState(() {
        _units = temp;
      });
    }
  }

  void _setupColors(ThemeData theme) {
    if (widget.fillBackground) {
      _backgroundColor = theme.primaryColor;
      _counterTextStyle = theme.textTheme.bodyText1!;
      _iconBackgroundColor = theme.primaryColor;
      _iconColor = theme.backgroundColor;
    } else {
      _backgroundColor = theme.backgroundColor;
      _counterTextStyle = theme.textTheme.bodyText2!;
      _iconBackgroundColor = theme.backgroundColor;
      _iconColor = theme.primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    _setupColors(Theme.of(context));

    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                _increameant(-1);
              },
              color: _iconBackgroundColor,
              icon: Icon(
                Icons.remove_circle_outlined,
                color: _iconColor,
              )),
          Text(_units.toString(),
              textAlign: TextAlign.center, style: _counterTextStyle),
          IconButton(
              onPressed: () {
                _increameant(1);
              },
              color: _iconBackgroundColor,
              icon: Icon(Icons.add_circle_rounded, color: _iconColor)),
        ],
      ),
    );
  }
}
