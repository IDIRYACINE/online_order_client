import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  final TextEditingController _newEmail = TextEditingController();
  final TextEditingController _newPhone = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  Future displayChangeElemntPoupUp(
      BuildContext context,
      Widget title,
      Function _newInfo,
      String hint,
      Icon icon,
      TextEditingController controller) async {
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
                            controller: controller,
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
                    _newInfo;
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
          leading: IconButton(
              onPressed: () => Navigator.pop(context, false),
              icon: const Icon(Icons.keyboard_return)),
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
                  const ProfileInfoLabel(
                      "wawadz2000@gmail.com", Icon(Icons.email)),
                  IconButton(
                    onPressed: () {
                      displayChangeElemntPoupUp(
                          context,
                          const Text("Set new Email : "),
                          () {},
                          "New Email Adresse",
                          const Icon(Icons.email),
                          _newEmail);
                    },
                    icon: const Icon(Icons.edit),
                    tooltip: "changer Email",
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const ProfileInfoLabel("+2130541341655", Icon(Icons.phone)),
                  IconButton(
                      onPressed: () {
                        displayChangeElemntPoupUp(
                            context,
                            const Text("Set new phone number : "),
                            () {},
                            " new phone number",
                            const Icon(Icons.phone),
                            _newPhone);
                      },
                      icon: const Icon(Icons.edit),
                      tooltip: "Changer le numero de telephone ")
                ]),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const ProfileInfoLabel("*********", Icon(Icons.lock)),
                  IconButton(
                    onPressed: () {
                      displayChangeElemntPoupUp(
                          context,
                          const Text("Set new password : "),
                          () {},
                          " new password",
                          const Icon(Icons.lock),
                          _newPassword);
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

class ProfileInfoLabel extends StatelessWidget {
  final String _title;
  final Icon _icon;
  const ProfileInfoLabel(this._title, this._icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 275,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: parseColor("#FCD5CE")),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Row(children: [
                const SizedBox(
                  width: 10,
                ),
                _icon,
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    _title,
                    style: const TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                    softWrap: false,
                    textAlign: TextAlign.left,
                  ),
                ),
              ]),
            ),
          ),
        ]);
  }
}
