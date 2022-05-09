import 'package:flutter/material.dart';

typedef OnChangeFunction = void Function(String value);

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool obsecureText;
  final bool canToggleObsecureText;
  final IconData? showTextIcon;
  final IconData? hideTextIcon;
  final OnChangeFunction onChange;

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
      sufficxIcon = showTextIcon;
      showTextIcon = widget.showTextIcon ?? Icons.visibility_off;
      hideTextIcon = widget.hideTextIcon ?? Icons.visibility;
    }
  }

  void toggleObsecureText(bool value) {
    if (value) {
      sufficxIcon = showTextIcon;
      obsecureText.value = value;
      return;
    }

    sufficxIcon = hideTextIcon;
    obsecureText.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null) Text(widget.label!),
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: widget.canToggleObsecureText
                ? ValueListenableBuilder<bool>(
                    valueListenable: obsecureText,
                    builder: (context, value, child) {
                      return IconButton(
                          onPressed: () {
                            toggleObsecureText(!obsecureText.value);
                          },
                          icon: Icon(sufficxIcon));
                    })
                : null,
          ),
          initialValue: widget.initialValue,
          obscureText: widget.obsecureText,
          onChanged: widget.onChange,
        ),
      ],
    );
  }
}

class FaultTolerantImage extends StatelessWidget {
  final String src;

  const FaultTolerantImage({Key? key, required this.src}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      errorBuilder: (context, object, stackTrace) {
        return Image.asset('assets/images/pizza2.jpg');
      },
    );
  }
}
