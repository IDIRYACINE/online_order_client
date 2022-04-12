import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Authentication/user_input_validator.dart';
import 'package:online_order_client/Application/Profile/profile_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:provider/provider.dart';

class ConfirmePasswordScreen extends StatefulWidget {
  const ConfirmePasswordScreen({Key? key}) : super(key: key);
  @override
  State<ConfirmePasswordScreen> createState() => _ConfirmePasswordScreenState();
}

class _ConfirmePasswordScreenState extends State<ConfirmePasswordScreen> {
  TextEditingController _PasswordController = TextEditingController();
  TextEditingController _code= TextEditingController();
   bool isVisible = false;
  IconData show = Icons.visibility_off;
  IconData hide = Icons.remove_red_eye;
  final UserInputValidtor valid = new UserInputValidtor();
  @override
  Widget build(BuildContext context) {
     HelpersProvider _helpers =
        Provider.of<HelpersProvider>(context, listen: false);

    ProfileHelper _profileHelper = _helpers.profileHelper;

    AuthenticationHelper _authHelper = _helpers.authHelper;
    return Scaffold(
      backgroundColor: parseColor("#F8EDEB"),
      appBar: AppBar(
        title: const Text(
          "Confirmation code",
          style: TextStyle(
            fontSize: 16.5,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: parseColor("#FCD5CE"),
        centerTitle: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context, false),
            icon: const Icon(Icons.keyboard_return)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              Text("Set New Password :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(mainAxisSize: MainAxisSize.max, children: [
                Container(
                  height: 50,
                  width: 260,
                  child: TextFormField(
                    controller: _PasswordController,
                     obscureText: isVisible,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "New Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: parseColor("#FFB5A7"),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: isVisible ? Icon(show) : Icon(hide)),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                           _authHelper.sendPasswordResetCode();
                    },
                    icon: Icon(Icons.send),
                    hoverColor: parseColor("#FCD5CE"),
                    color: parseColor("#FFB5A7"),
                    tooltip: "Send Confirmation Code to the Email")
              ]),
              SizedBox(height: 15),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: _code,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Confirmation code",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(
                      Icons.confirmation_num,
                      color: parseColor("#FFB5A7"),
                    ),
                  ),
                ),
              ),
              TextButton(onPressed: () {
                _authHelper.sendPasswordResetCode();
              }, child: Text("Resend Code")),
              ElevatedButton(
                  onPressed: () {
                  _authHelper.updatePassword(_PasswordController.text, _code.text);
                  },
                  child: Text(
                    'Confirme',
                    style: TextStyle(),
                  ),
                  style:
                      ElevatedButton.styleFrom(primary: parseColor("#FCD5CE")))
            ],
          ),
        ),
      ),
    );
  }
}
