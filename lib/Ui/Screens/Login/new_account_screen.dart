import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Authentication/user_input_validator.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:online_order_client/Ui/Components/buttons.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class NewAccountScreen extends StatefulWidget {
  const NewAccountScreen({Key? key}) : super(key: key);
  final double runSpacing = 8.0;

  @override
  _NewAccountScreenState createState() => _NewAccountScreenState();
}

class _NewAccountScreenState extends State<NewAccountScreen> {
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String username = "";
  String phone = "";

  void onEmailChanged(String value) {
    email = value;
  }

  void onPasswordChanged(String value) {
    password = value;
  }

  void onPhoneChanged(String value) {
    email = value;
  }

  void onUsernameChanged(String value) {
    password = value;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final AuthenticationHelper _authenticationHelper =
        Provider.of<HelpersProvider>(context, listen: false).authHelper;

    final ProfileModel profile = _authenticationHelper.getProfile();

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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextFormField(
                  label: usernameLabel,
                  initialValue: profile.getFullName(),
                  onChange: (value) {},
                  validator: UserInputValidtor.validateUsername,
                ),
                CustomTextFormField(
                  label: emailLabel,
                  initialValue: profile.getEmail(),
                  onChange: (value) {},
                  validator: UserInputValidtor.validateEmail,
                ),
                CustomTextFormField(
                  label: phoneLabel,
                  initialValue: profile.getPhoneNumber(),
                  onChange: (value) {},
                  validator: UserInputValidtor.validatePhoneNumber,
                ),
                CustomTextFormField(
                  label: passwordLabel,
                  hint: passwordHint,
                  canToggleObsecureText: true,
                  onChange: onPasswordChanged,
                ),
                DefaultButton(
                  width: double.infinity,
                  text: signupLabel,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _authenticationHelper.signUpWithEmailAndPassword(
                          username, email, password, phone);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
