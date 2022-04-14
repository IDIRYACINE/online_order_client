import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/user_input_validator.dart';
import 'package:online_order_client/Application/Profile/profile_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:provider/provider.dart';

import 'change_informartion_dialogue.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  final TextEditingController _newEmail = TextEditingController();
  final TextEditingController _newPhone = TextEditingController();
  final UserInputValidtor valid = UserInputValidtor();
  @override
  Widget build(BuildContext context) {
    HelpersProvider _helpers =
        Provider.of<HelpersProvider>(context, listen: false);

    ProfileHelper _profileHelper = _helpers.profileHelper;

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
                Text(
                  _profileHelper.getProfile().getFullName(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfoLabel(_profileHelper.getProfile().getEmail(),
                      const Icon(Icons.email)),
                  IconButton(
                    onPressed: () {
                      _profileHelper.updateEmail(_newEmail.text);
                      sendCodeAlert(context,
                          "We've send Email updating link , please check your email !");
                    },
                    icon: const Icon(Icons.edit),
                    tooltip: "changer Email",
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfoLabel(_profileHelper.getProfile().getPhoneNumber(),
                      const Icon(Icons.phone)),
                  IconButton(
                      onPressed: () {
                        changeElementPoupUp(
                            context, const Text("Set new phone number : "), () {
                          _profileHelper.updatePhoneNumber(_newPhone.text);
                          Navigator.of(context).pop();
                          valid.validatePhoneNumber(_newEmail.toString());
                        }, " new phone number", const Icon(Icons.phone),
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
                      sendCodeAlert(context,
                          "We've send Password updating link , please check your email !");
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
