import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:provider/provider.dart';

class FacebookLinkButton extends StatefulWidget {
  final Color? textColor;
  final Color? backgroundColor;
  final ShapeBorder shape;
  final double? width;
  final double? height;
  final double padding;
  const FacebookLinkButton(
      {Key? key,
      this.textColor,
      this.backgroundColor = Colors.blue,
      this.shape = const StadiumBorder(),
      this.width,
      this.height,
      this.padding = 8.0})
      : super(key: key);

  final double defaultHeight = 50.0;

  @override
  State<StatefulWidget> createState() => _FacebookLinkButtonState();
}

class _FacebookLinkButtonState extends State<FacebookLinkButton> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    AuthenticationHelper authenticationHelper =
        Provider.of<HelpersProvider>(context).authHelper;

    return Column(
      children: [
        Padding(
            padding: EdgeInsets.all(widget.padding),
            child: MaterialButton(
              color: widget.backgroundColor,
              shape: widget.shape,
              child: Text(
                "Link Facebook",
                style: theme.textTheme.button,
              ),
              onPressed: () {
                setState(() {
                  authenticationHelper.linkFacbookAccount();
                });
              },
            )),
        Padding(
            padding: EdgeInsets.all(widget.padding),
            child: MaterialButton(
              color: widget.backgroundColor,
              shape: widget.shape,
              child: Text(
                "Unlink Facebook",
                style: theme.textTheme.button,
              ),
              onPressed: () {
                authenticationHelper.unlinkFacbookAccount();

                return;
              },
            )),
      ],
    );
  }
}
