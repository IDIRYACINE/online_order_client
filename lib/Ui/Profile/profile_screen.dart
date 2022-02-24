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
  Future DisplayChangeElemntPoupUp(BuildContext context, Widget title) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red[50],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: const ChangeElementProfile()),
            title: title,
            actions: [
              ElevatedButton(onPressed: () {}, child: Text("data")),
              ElevatedButton(onPressed: () {}, child: Text("data"))
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: parseColor("#F8EDEB"),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "Bensadi Houssem",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "ID: 15241637",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfo("wawadz2000ghgfhgfhfghfghfgh0@gmail.com",
                      Icon(Icons.email)),
                  IconButton(
                    onPressed: () {
                      DisplayChangeElemntPoupUp(
                          context, Text("Set new Email : "));
                    },
                    icon: Icon(Icons.rotate_left_rounded),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfo("+2130541341655", Icon(Icons.phone)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.rotate_left_rounded),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfo("*********", Icon(Icons.lock)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.rotate_left_rounded),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
