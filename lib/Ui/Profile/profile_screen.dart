import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Components/bottom_nav_bar.dart';
import 'package:online_order_client/Ui/Components/components.dart';
import 'package:online_order_client/Ui/Profile/confirm_email_dailogue.dart';
import 'package:online_order_client/Ui/Profile/profile_dialogue.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  final List<Widget> dialogues = [
    const ChangeElementProfile(),
  ];
  int dialogueIndex = 0;
  Future displayChangeElemntPoupUp(BuildContext context, Widget title,
      Function confirmFunction, String hint, Icon icon) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red[50],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 220,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "$hint",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                prefixIcon: icon),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))),
            title: title,
            actions: [
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    confirmFunction;
                  },
                  child: const Text("Conferme"),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                width: 200,
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Exit"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              )
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: parseColor("#F8EDEB"),
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: parseColor("#FCD5CE"),
          centerTitle: false,
          leading: IconButton(onPressed: () => Navigator.pop(context, false), icon: const Icon(Icons.keyboard_return)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Bensadi Houssem",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfo("wawadz2000@gmail.com", const Icon(Icons.email)),
                  IconButton(
                    onPressed: () {
                      displayChangeElemntPoupUp(
                          context,
                          const Text("Set new Email : "),
                          () {},
                          "New Email Adresse",
                          Icon(Icons.email));
                    },
                    icon: const Icon(Icons.edit),
                    tooltip: "changer Email",
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfo("+2130541341655", const Icon(Icons.phone)),
                  IconButton(
                      onPressed: () {
                        displayChangeElemntPoupUp(
                            context,
                            const Text("Set new phone number : "),
                            () {},
                            " new phone number",
                            Icon(Icons.phone));
                      },
                      icon: const Icon(Icons.edit),
                      tooltip: "Changer le numero de telephone ")
                ]),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfo("*********", const Icon(Icons.lock)),
                  IconButton(
                    onPressed: () {
                      displayChangeElemntPoupUp(
                          context,
                          const Text("Set new password : "),
                          () {},
                          " new password",
                          Icon(Icons.lock));
                    },
                    icon: const Icon(Icons.edit),
                    tooltip: "Changer le mot de pass ",
                  )
                ]),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
