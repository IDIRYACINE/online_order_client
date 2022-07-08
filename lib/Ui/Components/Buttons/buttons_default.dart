import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Color? textColor;
  final Color? backgroundColor;
  final String text;
  final VoidCallback? onPressed;
  final ShapeBorder shape;
  final double? width;
  final double? height;

  const DefaultButton(
      {Key? key,
      this.textColor,
      this.backgroundColor,
      required this.text,
      this.onPressed,
      this.shape = const StadiumBorder(),
      this.width,
      this.height})
      : super(key: key);

  final double defaultHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SizedBox(
        width: width,
        height: height ?? defaultHeight,
        child: MaterialButton(
          color: backgroundColor ?? theme.primaryColor,
          shape: shape,
          child: Text(
            text,
            style: theme.textTheme.button,
          ),
          onPressed: onPressed ?? () {},
        ));
  }
}
