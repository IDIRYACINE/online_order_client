import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/shared/Components.dart';
import 'package:provider/provider.dart';
class NewAccountScreen extends StatefulWidget {
  const NewAccountScreen({ Key? key }) : super(key: key);

  @override
  _NewAccountScreenState createState() => _NewAccountScreenState();
}

class _NewAccountScreenState extends State<NewAccountScreen> {
    bool isVisible = false;
  IconData show = Icons.visibility_off;
  IconData hide = Icons.remove_red_eye;
      var emailController = TextEditingController();
      var passwordController = TextEditingController();
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
              Text("\"bienvenu dans notre restaurant , nous sommes tres heureux de votre visite a notre service alimentaire\"",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "lobster",
              ),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              Text("creé votre new compte , Now !!",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "lobster",
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
              ),
              SizedBox(height:15),
              Container(
                    width: 300,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "prenome",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.person , color: parseColor("#FFB5A7"),
                        ),
                      ),
                    ),
                  ), 
                SizedBox(height:15),
                Container(
                    width: 300,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: " nome",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.person , color: parseColor("#FFB5A7"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:15),
                Container(
                    width: 300,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "l'adresse Email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.mail , color: parseColor("#FFB5A7"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:15),
                Container(
                    width: 300,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "number phone",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.phone , color: parseColor("#FFB5A7"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:15),
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
                SizedBox(height: 7),
                Container(
                  height: 60,
                  width: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: parseColor("#FFB5A7"),
                  ),
                  child: MaterialButton(onPressed: (){},
                  child: Text("Sign up",
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