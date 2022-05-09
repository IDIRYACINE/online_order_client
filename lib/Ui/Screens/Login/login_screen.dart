import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:online_order_client/Ui/Themes/messages.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = false;
  IconData show = Icons.visibility_off;
  IconData hide = Icons.remove_red_eye;
  String email = "";
  String password = "";

  void onEmailChanged(String value) {
    email = value;
  }

  void onPasswordChanged(String value) {
    password = value;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AuthenticationHelper _authenticationHelper =
        Provider.of<HelpersProvider>(context, listen: false).authHelper;

    _authenticationHelper.setBuildContext(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Column(
          children: [
            Image.asset('assets/images/pizza2.jpg'),
            const DefaultTabController(
              length: 2,
              child: TabBar(tabs: [
                Tab(
                  text: Messages.login,
                ),
                Tab(
                  text: Messages.signup,
                )
              ]),
            ),
            CustomTextFormField(
              label: Messages.emailLabel,
              hint: Messages.emailHint,
              onChange: onEmailChanged,
            ),
            CustomTextFormField(
              label: Messages.passwordLabel,
              hint: Messages.passwordHint,
              onChange: onPasswordChanged,
            )
          ],
        ));
  }
}
