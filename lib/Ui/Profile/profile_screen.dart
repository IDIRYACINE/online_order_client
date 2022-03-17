import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Components/bottom_nav_bar.dart';
import 'package:online_order_client/Ui/Components/components.dart';
import 'package:online_order_client/Ui/Profile/confirm_email_dailogue.dart';
import 'package:online_order_client/Ui/Profile/profile_dialogue.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  final List<Widget> dialogues = [
    const ChangeElementProfile(),
    const ConfirmEmail()
  ];
  int dialogueIndex = 0;
  Future displayChangeElemntPoupUp(BuildContext context, Widget title,
      int dailogueIndex, Function confirmFunction) async {
    dialogueIndex = dailogueIndex;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red[50],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: dialogues[dailogueIndex]),
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
        bottomNavigationBar: const BottomNavBar(),
        appBar: AppBar(
          title: const Text(
            "THe House restaurante",
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: parseColor("#FCD5CE"),
          centerTitle: false,
          leading: IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.person)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
          ],
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
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 30
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfo("wawadz2000@gmail.com",
                      const Icon(Icons.email)),
                  IconButton(
                    onPressed: () {
                      displayChangeElemntPoupUp(context,
                          const Text("Set new Email : "), dialogueIndex, () {
                        setState(() {
                          dialogueIndex == 1;
                          displayChangeElemntPoupUp(
                              context,
                              const Text("Set new Email : "),
                              dialogueIndex, () {
                            setState(() {
                              dialogueIndex == 0;
                            });
                          });
                        });
                      });
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
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      tooltip: "Changer le numero de telephone ")
                ]),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfo("*********", const Icon(Icons.lock)),
                  IconButton(
                    onPressed: () {},
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
