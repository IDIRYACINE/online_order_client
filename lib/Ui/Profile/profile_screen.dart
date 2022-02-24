import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Components/components.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:online_order_client/Ui/Profile/Profile_dialoge.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  


  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  Future DisplayChangeElemntPoupUp(BuildContext context, Widget title)  {
    return  showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red[50],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: const ChangeElementProfile(),
            title: title,
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: parseColor("#F8EDEB"),
      body : Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.asset('assets/images/profile.png',
            fit: BoxFit.fill,
            ),
          ),
          Text("Bensadi Houssem",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
          Text("ID: 15241637",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(
            height: 50,
          ),
          ProfileInfo("wawadz2000ghgfhgfhfghfghfgh0@gmail.com" , ()
          {
            DisplayChangeElemntPoupUp(context, Text("set new email"));

          } , Icon(Icons.email)),
          SizedBox(
            height: 30,
          ),
          ProfileInfo("+213541341622" , (){
            ChangeElementProfile();
          } , Icon(Icons.phone)),
          SizedBox(
            height: 30,
          ),
          ProfileInfo("**********" , (){} , Icon(Icons.lock)),
          SizedBox(
            height: 30,
          ),
        ],
      )
    );
  }
}
