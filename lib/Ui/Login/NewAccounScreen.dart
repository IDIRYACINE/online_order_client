import 'package:flutter/material.dart';
import 'package:online_order_client/Application/authentication.dart';
import 'package:online_order_client/Application/user_input_validator.dart';
import 'package:online_order_client/Ui/shared/Components.dart';
import 'package:provider/provider.dart';

class NewAccountScreen extends StatefulWidget {
  final Authentication _authentication;
  const NewAccountScreen(this._authentication, {Key? key}) : super(key: key);

  @override
  _NewAccountScreenState createState() => _NewAccountScreenState();
}

class _NewAccountScreenState extends State<NewAccountScreen> {
  bool isVisible = false;
  IconData show = Icons.visibility_off;
  IconData hide = Icons.remove_red_eye;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: parseColor("#FCD5CE"),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "\"bienvenu dans notre restaurant , nous sommes tres heureux de votre visite a notre service alimentaire\"",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "lobster",
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "creé votre new compte , Now !!",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "lobster",
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _firstNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "prenome",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: parseColor("#FFB5A7"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _lastNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: " nome",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: parseColor("#FFB5A7"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "l'adresse Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: parseColor("#FFB5A7"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "number phone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: parseColor("#FFB5A7"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 300,
                child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      hintText: "Password",
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
                    )),
              ),
              const SizedBox(height: 7),
              Container(
                height: 60,
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: parseColor("#FFB5A7"),
                ),
                child: MaterialButton(
                  onPressed: () {
                    UserInputValidtor validator = UserInputValidtor();
                    String firstName = _firstNameController.text;
                    String lastName = _lastNameController.text;
                    String password = _passwordController.text;
                    String email = _emailController.text;
                    String phoneNumber = _phoneNumberController.text;

                    if (validator.validateNewAccountRegistration(
                        firstName, lastName, email, password, phoneNumber)) {
                      widget._authentication
                          .signUpWithEmailAndPassword(email, password);
                    }
                  },
                  child: const Text(
                    "Sign up",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
