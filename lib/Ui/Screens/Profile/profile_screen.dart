import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Authentication/user_input_validator.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/Buttons/button_facebook_link.dart';
import 'package:online_order_client/Ui/Components/Buttons/buttons_default.dart';
import 'package:online_order_client/Ui/Components/cards.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final bool isSendingOrder;
  final VoidCallback triggerCallback;
  final double cardsPadding = 10.0;
  const ProfileScreen(
      {Key? key, required this.isSendingOrder, required this.triggerCallback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final UserInputValidtor userInputValidtor = UserInputValidtor();

  @override
  Widget build(BuildContext context) {
    AuthenticationHelper _authHelper =
        Provider.of<HelpersProvider>(context, listen: false).authHelper;

    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.surface,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Card(
              elevation: 4.0,
              color: theme.cardColor,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: theme.colorScheme.secondary,
                  ))),
          Text(profileTitle, style: theme.textTheme.headline2),
          Card(
            elevation: 4.0,
            color: theme.cardColor,
            child: IconButton(
                onPressed: () {
                  _authHelper.saveProfile();
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.done,
                  color: theme.colorScheme.secondary,
                )),
          ),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(widget.cardsPadding),
                child: InformationCard(
                  label: emailLabel,
                  initialValue: _authHelper.getEmail(),
                  onChangeConfirm: _authHelper.updateEmail,
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(widget.cardsPadding),
                  child: InformationCard(
                    label: usernameLabel,
                    initialValue: _authHelper.getFullName(),
                    onChangeConfirm: _authHelper.updateFullName,
                  )),
              Padding(
                  padding: EdgeInsets.all(widget.cardsPadding),
                  child: InformationCard(
                    label: phoneLabel,
                    initialValue: _authHelper.getPhone(),
                    onChangeConfirm: _authHelper.updatePhoneNumber,
                  )),
              Padding(
                  padding: EdgeInsets.all(widget.cardsPadding),
                  child: InformationCard(
                    label: addressLabel,
                    initialValue: _authHelper.getAddress(),
                    onPressed: () {
                      _authHelper.setDeliveryAddresse(context);
                    },
                    onChangeConfirm: (value) {},
                  )),
             
              Padding(
                  padding: EdgeInsets.all(widget.cardsPadding),
                  child: DefaultButton(
                    text: widget.isSendingOrder ? confirmLabel : logoutLabel,
                    width: double.infinity,
                    onPressed: () {
                      widget.triggerCallback();
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
