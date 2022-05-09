import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:provider/provider.dart';

class NewAccountScreen extends StatefulWidget {
  const NewAccountScreen({Key? key}) : super(key: key);

  @override
  _NewAccountScreenState createState() => _NewAccountScreenState();
}

class _NewAccountScreenState extends State<NewAccountScreen> {
  bool isVisible = false;
  IconData show = Icons.visibility_off;
  IconData hide = Icons.remove_red_eye;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthenticationHelper _authHelper =
        Provider.of<HelpersProvider>(context).authHelper;

    return Scaffold(
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
                  controller: _fullNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "full name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: const Icon(
                      Icons.person,
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
                    prefixIcon: const Icon(
                      Icons.mail,
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
                    prefixIcon: const Icon(
                      Icons.phone,
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
                      prefixIcon: const Icon(
                        Icons.lock,
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
                ),
                child: MaterialButton(
                  onPressed: () {
                    String fullName = _fullNameController.text;
                    String password = _passwordController.text;
                    String email = _emailController.text;
                    String phoneNumber = _phoneNumberController.text;
                    /* TODO */
                    _authHelper.setBuildContext(context);
                    _authHelper.signUpWithEmailAndPassword(
                        fullName, email, password, phoneNumber);
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
