import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Components/buttons.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';

typedef FormFieldValidator = String? Function(String? value);

class InformationCard extends StatefulWidget {
  final String label;
  final String? initialValue;
  final Color? backgroundColor;
  final TextStyle? labelTextStyle;
  final TextStyle? valueTextStyle;
  final Widget? trailing;
  final Color? borderColor;
  final EdgeInsets padding;
  final VoidCallback? onPressed;
  final FormFieldValidator? validator;

  const InformationCard(
      {Key? key,
      required this.label,
      this.initialValue,
      this.backgroundColor,
      this.labelTextStyle,
      this.valueTextStyle,
      this.trailing,
      this.borderColor,
      this.padding = const EdgeInsets.all(10),
      this.onPressed,
      this.validator})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  late VoidCallback alertDialogCallback;
  late ValueNotifier<String> value;

  Future<AlertDialog?> defaultAlertDialog(
      ValueNotifier<String> src, BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    String temp = "";

    return showDialog<AlertDialog>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(widget.label),
          content: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: CustomTextFormField(
                        onChange: (value) {
                          temp = value;
                        },
                        initialValue: value.value,
                        validator: widget.validator,
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(cancelLabel)),
                          DefaultButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  src.value = temp;
                                  Navigator.of(context).pop();
                                }
                              },
                              text: confirmLabel),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    value = ValueNotifier(widget.initialValue ?? "");

    alertDialogCallback = widget.onPressed ??
        () {
          defaultAlertDialog(value, context);
        };

    return InkResponse(
      onTap: () {
        alertDialogCallback();
      },
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? theme.cardColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
              color: widget.borderColor ?? Colors.grey[300]!, width: 2),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(widget.label,
                    style: widget.labelTextStyle ?? theme.textTheme.subtitle1),
                ValueListenableBuilder<String>(
                    valueListenable: value,
                    builder: (buildContext, newValue, child) {
                      return Text(newValue,
                          style: widget.valueTextStyle ??
                              theme.textTheme.headline2);
                    })
              ],
            ),
            if (widget.trailing != null) widget.trailing!
          ],
        ),
      ),
    );
  }
}
