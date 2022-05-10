import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Color? textColor;
  final Color? backgroundColor;
  final String text;
  final VoidCallback? onPressed;
  final ShapeBorder? shape;
  final double? width;
  final double? height;

  const DefaultButton(
      {Key? key,
      this.textColor,
      this.backgroundColor,
      required this.text,
      this.onPressed,
      this.shape,
      this.width,
      this.height})
      : super(key: key);

  final double defaultHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SizedBox(
        width: width ?? double.infinity,
        height: height ?? defaultHeight,
        child: MaterialButton(
          color: backgroundColor ?? theme.primaryColor,
          shape: shape ?? const StadiumBorder(),
          child: Text(
            text,
            style: theme.textTheme.button,
          ),
          onPressed: onPressed ?? () {},
        ));
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

  void _increameant(int step) {
    int temp = _units + step;
    if (temp > 0) {
      widget.onCountChange(temp);
      setState(() {
        _units = temp;
      });
    }
  }

  void _setup(ThemeData theme) {
    _units = widget.initialCount;

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
    _setup(Theme.of(context));

    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkResponse(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              _increameant(-1);
            },
            child: ColoredBox(
                color: _iconBackgroundColor,
                child: Icon(
                  Icons.remove_circle_outlined,
                  color: _iconColor,
                )),
          ),
          Text(_units.toString(),
              textAlign: TextAlign.center, style: _counterTextStyle),
          InkResponse(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              _increameant(1);
            },
            child: ColoredBox(
                color: _iconBackgroundColor,
                child: Icon(Icons.add_circle_rounded, color: _iconColor)),
          )
        ],
      ),
    );
  }
}
