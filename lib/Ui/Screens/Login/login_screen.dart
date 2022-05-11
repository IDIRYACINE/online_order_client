import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Authentication/user_input_validator.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
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
  GlobalKey<FormState> formKey = GlobalKey();

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
    final NavigationProvider _navigationHelper =
        Provider.of<NavigationProvider>(context, listen: false);
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
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(
                      label: emailLabel,
                      hint: emailHint,
                      onChange: onEmailChanged,
                      validator: UserInputValidtor.validateEmail,
                    ),
                    CustomTextFormField(
                      label: passwordLabel,
                      hint: passwordHint,
                      canToggleObsecureText: true,
                      onChange: onPasswordChanged,
                    ),
                    DefaultButton(
                      text: loginLabel,
                      width: double.infinity,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _authenticationHelper.signInWithEmailAndPassword(
                              email, password);
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(alternativeLoginLabel,
                          style: theme.textTheme.subtitle2),
                    ),
                    const Divider(
                      thickness: 4.0,
                    ),
                    DefaultButton(
                      backgroundColor: Colors.blue,
                      text: facebookLoginLabel,
                      width: double.infinity,
                      onPressed: () {
                        _authenticationHelper.signInWithFacebook();
                      },
                    ),
                    Row(
                      children: [
                        const Text(registerAccountLabel),
                        TextButton(
                            onPressed: () {
                              _navigationHelper.navigateToNewAccount(context,
                                  replace: true);
                            },
                            child: Text(
                              registerLabel,
                              style: theme.textTheme.subtitle2,
                            ))
                      ],
                    )
                  ]),
            )),
      ],
    ));
  }
}
