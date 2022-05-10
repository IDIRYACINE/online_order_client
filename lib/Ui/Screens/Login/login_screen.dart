import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/buttons.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final double runSpacing = 8.0;
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = false;

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
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.center,
              image: AssetImage("assets/images/food.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(16),
            color: theme.backgroundColor,
            child: Wrap(runSpacing: widget.runSpacing, children: [
              CustomTextFormField(
                label: emailLabel,
                hint: emailHint,
                onChange: onEmailChanged,
              ),
              CustomTextFormField(
                label: passwordLabel,
                hint: passwordHint,
                canToggleObsecureText: true,
                onChange: onPasswordChanged,
              ),
              DefaultButton(
                text: login,
                onPressed: () {
                  _authenticationHelper.signInWithEmailAndPassword(
                      email, password);
                },
              ),
            ])),
      ],
    ));
  }
}
