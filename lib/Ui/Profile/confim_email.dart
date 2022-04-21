import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Profile/profile_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:provider/provider.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';

class ConfirmeEmailScreen extends StatefulWidget {
  const ConfirmeEmailScreen({Key? key}) : super(key: key);
  @override
  State<ConfirmeEmailScreen> createState() => _ConfirmeEmailScreenState();
}

class _ConfirmeEmailScreenState extends State<ConfirmeEmailScreen> {
  final TextEditingController? _newEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    HelpersProvider _helpers =
        Provider.of<HelpersProvider>(context, listen: false);
    AuthenticationHelper _authHelper = _helpers.authHelper;
    ProfileHelper _profileHelper = _helpers.profileHelper;
    void validateEmail(String val,String empty,String invalid,String seccus) {
      if (val.isEmpty) {
        setState(() {
          sendCodeAlert(
              context, empty);
        });
      } else if (!EmailValidator.validate(val, true)) {
        setState(() {
          sendCodeAlert(
              context, invalid);
        });
      } else {
        setState(() {
          sendCodeAlert(
              context, seccus);
        });
      }
    }

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
              const SizedBox(
                height: 150,
              ),
              const Text("Set New Email :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              
                 Row(mainAxisSize: MainAxisSize.max, children: [
                  SizedBox(
                    height: 50,
                    width: 290,
                    child: TextFormField(
                      controller: _newEmail!,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "New Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: parseColor("#FFB5A7"),
                        ),
                      ),
                    ),
                  ),
                  
                ]),
              
              const SizedBox(height: 15),
              
              ElevatedButton(
                  onPressed: () {
                    validateEmail(
                        _newEmail!.text,
                        "Email can't be Empty !",
                        "Email invalid !",
                        "We have been send you a link to your Email , please check your Email !");
                         _authHelper.updateEmail(_newEmail!.text);
                         _profileHelper.updateEmail(_newEmail!.text);
                  },
                  child: const Text(
                    'Confirm',
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
