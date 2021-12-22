import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/shared/Components.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
    final _formKey = GlobalKey<FormState>();
    bool isVisible = false;
  IconData show = Icons.visibility_off;
  IconData hide = Icons.remove_red_eye;
      var emailController = TextEditingController();
      var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: parseColor("#FCD5CE"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Image.asset("assets/images/PizzaLogo.png",
                )
                ),
                Text("The Big House restaurenté",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico"
                ),
                textScaleFactor: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "E-mail Adress",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.email_outlined , color: parseColor("#FFB5A7"),
                      ),
                    ),
                  ),
                ), 
                SizedBox(height: 15,),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.lock, color: parseColor("#FFB5A7"),
                      ),
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          isVisible = !isVisible;

                        });
                      },  icon: isVisible? Icon(show) :  Icon(hide)),
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Forget Password ?",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children:[ Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                       color: parseColor("#FFB5A7"),
                    ),
                    child: MaterialButton(
                      onPressed: (){},
                     child: Text("login",
                     style: TextStyle(
                          fontSize: 22,
                     ),)
                     ),
                    ),
                    Text("Or"),
                    Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                       color: parseColor("#FFB5A7"),
                    ),
                    child: MaterialButton(
                      onPressed: (){},
                     child: Row(
                       children: [Text(" with Facebook",
                       style: TextStyle(
                            fontSize: 12,
                       ),
                       ),
                       SizedBox(width: 5,),
                       CircleAvatar(child: Icon(Icons.facebook), radius: 15,)
                       ])
                     ),
                    ),
                  ]
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    splashColor: parseColor("#FFB5A7"),
                    onPressed: (){},
                    child: Text("Create a New Account")))
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