import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:online_order_client/Ui/shared/Components.dart';

class DelivrationInfo extends StatefulWidget {
  const DelivrationInfo({ Key? key }) : super(key: key);

  @override
  _DelivrationInfoState createState() => _DelivrationInfoState();
}

class _DelivrationInfoState extends State<DelivrationInfo> {
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
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text("ajouter les informmation de delivration !!",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "lobster",
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
                ),
                Container(
                  height: 200,
                  width: 400,
                  child: Image.asset("assets/images/Dv logo.png",
                  cacheHeight: 280,
                  cacheWidth: 400,
                ),
                ),
                Container(
                      width: 300,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Full name",
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
                          hintText: "numeri d'identité",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(Icons.contacts_rounded , color: parseColor("#FFB5A7"),
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
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          hintText: "l'adresse",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(Icons.gps_fixed_outlined , color: parseColor("#FFB5A7"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:15),
                  Container(
                    height: 60,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: parseColor("#FFB5A7"),
                    ),
                    child: MaterialButton(onPressed: (){},
                    child: Container(
                      width: 300,
                      height: 150,
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [Text("Set your location  ",
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.place,
                        color: parseColor("#F8EDEB"),
                        ),
                        ]
                      ),
                    ),
                    ),
                  )
                      ],
            ),
          ),
        ),
      ),
    );
  }
}