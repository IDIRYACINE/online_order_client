import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Authentication/user_input_validator.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/buttons.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class NewAccountScreen extends StatefulWidget {
  final double runSpacing = 8.0;

  const NewAccountScreen({Key? key}) : super(key: key);

  @override
  _NewAccountScreenState createState() => _NewAccountScreenState();
}

class _NewAccountScreenState extends State<NewAccountScreen> {
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String username = "";
  String phone = "";

  final ValueNotifier<bool> isPasswordObsecure = ValueNotifier(true);

  void onEmailChanged(String value) {
    email = value;
  }

  void onPasswordChanged(String value) {
    password = value;
  }

  void onPhoneChanged(String value) {
    phone = value;
  }

  void onUsernameChanged(String value) {
    username = value;
  }

  void toggleObsecurePassword(bool value) {
    isPasswordObsecure.value = value;
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
          padding: const EdgeInsets.all(spaceDefault),
          decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(borderCircularRaduisLarge),
                topRight: Radius.circular(borderCircularRaduisLarge),
              )),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    label: usernameLabel,
                    onChange: onUsernameChanged,
                    validator: UserInputValidtor.validateUsername,
                  ),
                  CustomTextFormField(
                    label: emailLabel,
                    onChange: onEmailChanged,
                    validator: UserInputValidtor.validateEmail,
                  ),
                  CustomTextFormField(
                    label: phoneLabel,
                    onChange: onPhoneChanged,
                    validator: UserInputValidtor.validatePhoneNumber,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: isPasswordObsecure,
                    builder: (buildContext, value, child) {
                      return CustomTextFormField(
                        label: passwordLabel,
                        hint: passwordHint,
                        obsecureText: !value,
                        trailing: ToggleButton(
                          isActive: value,
                          toggleCallback: (toggleValue) {
                            isPasswordObsecure.value = toggleValue;
                          },
                        ),
                        onChange: onPasswordChanged,
                      );
                    },
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
        ),
      ],
    ));
  }
}
