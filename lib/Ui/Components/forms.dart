import 'package:flutter/material.dart';

typedef OnChangeFunction = void Function(String value);
typedef FormFieldValidator = String? Function(String? value);

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool obsecureText;
  final bool canToggleObsecureText;
  final IconData? showTextIcon;
  final IconData? hideTextIcon;
  final OnChangeFunction onChange;
  final EdgeInsets? paddings;
  final Color? textFieldColor;
  final FormFieldValidator? validator;

  const CustomTextFormField({
    Key? key,
    this.label,
    this.hint,
    this.initialValue,
    this.obsecureText = false,
    this.showTextIcon,
    this.hideTextIcon,
    this.canToggleObsecureText = false,
    required this.onChange,
    this.paddings,
    this.textFieldColor,
    this.validator,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late IconData sufficxIcon;
  late IconData showTextIcon;
  late IconData hideTextIcon;
  late final ValueNotifier<bool> obsecureText;

  void setup() {
    obsecureText = ValueNotifier<bool>(widget.obsecureText);

    if (widget.canToggleObsecureText) {
      showTextIcon = widget.showTextIcon ?? Icons.visibility_off;
      hideTextIcon = widget.hideTextIcon ?? Icons.visibility;
      sufficxIcon = showTextIcon;
    }
  }

  void toggleObsecureText(bool value) {
    if (value) {
      sufficxIcon = showTextIcon;
      obsecureText.value = !value;
      return;
    }

    sufficxIcon = hideTextIcon;
    obsecureText.value = !value;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    setup();

    return Padding(
        padding: widget.paddings ?? const EdgeInsets.all(8),
        child: ValueListenableBuilder<bool>(
            valueListenable: obsecureText,
            builder: (context, value, child) {
              return TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      widget.textFieldColor ?? theme.scaffoldBackgroundColor,
                  labelStyle: theme.textTheme.subtitle1,
                  labelText: widget.label,
                  hintText: widget.hint,
                  hintStyle: theme.textTheme.bodyText1,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIcon: widget.canToggleObsecureText
                      ? IconButton(
                          onPressed: () {
                            toggleObsecureText(obsecureText.value);
                          },
                          icon: Icon(sufficxIcon))
                      : null,
                ),
                initialValue: widget.initialValue,
                obscureText: obsecureText.value,
                onChanged: widget.onChange,
                validator: widget.validator,
              );
            }));
  }
}

class FaultTolerantImage extends StatelessWidget {
  final String src;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const FaultTolerantImage(
    this.src, {
    Key? key,
    this.height,
    this.width,
    this.fit,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, object, stackTrace) {
        return Image.asset(
          'assets/images/pizza2.jpg',
          height: height,
          width: width,
          fit: fit,
        );
      },
    );
  }
}
