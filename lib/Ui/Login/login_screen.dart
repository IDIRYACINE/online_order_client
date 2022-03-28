import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/components.dart';
import 'package:provider/provider.dart';

import '../../Application/Providers/navigation_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  IconData show = Icons.visibility_off;
  IconData hide = Icons.remove_red_eye;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthenticationHelper _authenticationHelper =
        Provider.of<HelpersProvider>(context, listen: false).authHelper;
    _authenticationHelper.setBuildContext(context);

    return Scaffold(
      backgroundColor: parseColor("#FCD5CE"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/images/PizzaLogo.png",
                    )),
                const Text(
                  "The Big House restaurenté",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico"),
                  textScaleFactor: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "E-mail Adress",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: parseColor("#FFB5A7"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                            controller: passwordController,
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
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Forget Password ?",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: parseColor("#FFB5A7"),
                          ),
                          child: MaterialButton(
                              onPressed: () {
                                _authenticationHelper
                                    .signInWithEmailAndPassword(
                                        Provider.of<HelpersProvider>(context,
                                                listen: false)
                                            .profileHelper,
                                        emailController.text,
                                        passwordController.text);
                              },
                              child: const Text(
                                "login",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              )),
                        ),
                        const Text("Or"),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: parseColor("#FFB5A7"),
                          ),
                          child: MaterialButton(
                              onPressed: () {
                                _authenticationHelper.signInWithFacebook();
                              },
                              child: Row(children: const [
                                Text(
                                  " with Facebook",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CircleAvatar(
                                  child: Icon(Icons.facebook),
                                  radius: 15,
                                )
                              ])),
                        ),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: MaterialButton(
                              splashColor: parseColor("#FFB5A7"),
                              onPressed: () {
                                Provider.of<NavigationProvider>(context,
                                        listen: false)
                                    .navigateToNewAccount(context);
                              },
                              child: const Text("Create a New Account")))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
