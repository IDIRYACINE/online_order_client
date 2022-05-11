import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Authentication/user_input_validator.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/buttons.dart';
import 'package:online_order_client/Ui/Components/cards.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final double cardsPadding = 10.0;
  const ProfileScreen({Key? key}) : super(key: key);

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
                  icon: const Icon(Icons.arrow_back_ios))),
          Text(profileTitle, style: theme.textTheme.headline3),
          Card(
            elevation: 4.0,
            color: theme.cardColor,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.supervised_user_circle_sharp)),
          ),
        ]),
      ),
      backgroundColor: theme.colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(widget.cardsPadding),
              child: InformationCard(
                label: emailLabel,
                initialValue: _authHelper.getEmail(),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(widget.cardsPadding),
                child: InformationCard(
                  label: usernameLabel,
                  initialValue: _authHelper.getFullName(),
                )),
            Padding(
                padding: EdgeInsets.all(widget.cardsPadding),
                child: InformationCard(
                  label: phoneLabel,
                  initialValue: _authHelper.getPhone(),
                )),
            Padding(
                padding: EdgeInsets.all(widget.cardsPadding),
                child: InformationCard(
                  label: addressLabel,
                  initialValue: _authHelper.getAddress(),
                  onPressed: () {
                    _authHelper.setDeliveryAddresse(context);
                  },
                )),
            Padding(
                padding: EdgeInsets.all(widget.cardsPadding),
                child: DefaultButton(
                  text: logoutLabel,
                  width: double.infinity,
                  onPressed: () {
                    _authHelper.logout();
                    Navigator.of(context).pop();
                  },
                ))
          ],
        ),
      ),
    );
  }
}
