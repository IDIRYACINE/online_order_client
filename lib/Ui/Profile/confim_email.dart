import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:provider/provider.dart';

class ConfirmeEmailScreen extends StatefulWidget {
  const ConfirmeEmailScreen({Key? key}) : super(key: key);
  @override
  State<ConfirmeEmailScreen> createState() => _ConfirmeEmailScreenState();
}

class _ConfirmeEmailScreenState extends State<ConfirmeEmailScreen> {
  final TextEditingController _newEmail = TextEditingController();
  final TextEditingController _code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    HelpersProvider _helpers =
        Provider.of<HelpersProvider>(context, listen: false);

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
              const SizedBox(
                height: 150,
              ),
              const Text("Set New Email :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(mainAxisSize: MainAxisSize.max, children: [
                SizedBox(
                  height: 50,
                  width: 260,
                  child: TextFormField(
                    controller: _newEmail,
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
                IconButton(
                    onPressed: () {
                      _authHelper.updateEmail(_newEmail.text);
                    },
                    icon: const Icon(Icons.send),
                    hoverColor: parseColor("#FCD5CE"),
                    color: parseColor("#FFB5A7"),
                    tooltip: "Send Confirmation Code to the Email")
              ]),
              const SizedBox(height: 15),
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
              TextButton(
                  onPressed: () {
                    _authHelper.sendConfirmationEmail(_newEmail.text);
                    sendCodeAlert(
                        context, "We send A code , Please check your Email!");
                  },
                  child: const Text("Resend Code")),
              ElevatedButton(
                  onPressed: () {
                    _authHelper.updateEmail(_newEmail.text);
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
