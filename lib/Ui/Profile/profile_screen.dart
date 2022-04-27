import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Authentication/user_input_validator.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:online_order_client/Ui/Profile/confim_email.dart';
import 'package:provider/provider.dart';
import 'change_informartion_dialogue.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  final TextEditingController _newPhone = TextEditingController();
  final UserInputValidtor valid = UserInputValidtor();
  @override
  Widget build(BuildContext context) {
    HelpersProvider _helpers =
        Provider.of<HelpersProvider>(context, listen: false);
    AuthenticationHelper _authHelper = _helpers.authHelper;

    return Scaffold(
        backgroundColor: parseColor("#F8EDEB"),
        appBar: AppBar(
          title: const Text(
            "personal informations",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: "Lobster",
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
                  _authHelper.getProfile().getFullName(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfoLabel(_authHelper.getProfile().getEmail(),
                      const Icon(Icons.email)),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ConfirmeEmailScreen()));
                    },
                    icon: const Icon(Icons.edit),
                    tooltip: "changer Email",
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ProfileInfoLabel(_authHelper.getProfile().getPhoneNumber(),
                      const Icon(Icons.phone)),
                  IconButton(
                      onPressed: () {
                        changeElementPoupUp(
                            context, const Text("Set new phone number : "), () {
                          _authHelper.updatePhoneNumber(_newPhone.text);
                          Navigator.of(context).pop();
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
                      _authHelper.sendPasswordResetCode();
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
