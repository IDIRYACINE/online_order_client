import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/user_input_validator.dart';
import 'package:online_order_client/Application/Profile/profile_helper.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';

class ConfirmeEmailScreen extends StatefulWidget {
  const ConfirmeEmailScreen({ Key? key }) : super(key: key);
  @override
  State<ConfirmeEmailScreen> createState() => _ConfirmeEmailScreenState();
}

class _ConfirmeEmailScreenState extends State<ConfirmeEmailScreen> {
  TextEditingController? _emailController;
    TextEditingController? _code;
   final UserInputValidtor valid = new UserInputValidtor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: parseColor("#F8EDEB"),
      appBar:AppBar(
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
          scrollDirection:Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
                Text("Set New Email :",
                style:TextStyle(
                  fontSize: 20,
                  fontWeight:FontWeight.bold
                )
                
                ),
               Row(
                    mainAxisSize: MainAxisSize.max,
                    children: 
                    [Container(
                      height: 50,
                      width: 260,
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "New Email",
                          border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: parseColor("#FFB5A7"),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        valid.validateEmail(_emailController.toString());
                      }, 
                      icon: Icon(Icons.send),
                      hoverColor: parseColor("#FCD5CE"),
                      color: parseColor("#FFB5A7"),
                      tooltip:"Send Confirmation Code to the Email"
                      
                      )
                    ]
                  ),
                
             
              SizedBox(
                height:15
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: _code,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Confirmation code",
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(
                      Icons.confirmation_num,
                      color: parseColor("#FFB5A7"),
                    ),
                  ),
                ),
              ),
                TextButton(
                  onPressed: (){
                  }, 
                  child: Text("Resend Code")),
                  ElevatedButton(onPressed: (){
                  }, child: Text('Confirme',
                  style: TextStyle(),
                  ),
                  style: ElevatedButton.styleFrom(
                  primary: parseColor("#FCD5CE"))
                  )],
          ),
        ),
      ),
    );
  }
}