import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  IconData iconStatus = Icons.access_time_outlined;
  double avatarSize = 35;
  Color avatarColor = parseColor("#FCD5CE");
  Color iconColor = Colors.white;
  double iconeSize = 35;
  static bool state = true; //as controller
  String? stt = state ? "Ready" : "Waiting. . .";
  IconData iconeStatusTrue = Icons.check;
  double iconeSizeTrue = 40;
  double avatarSizeTrue = 40;
  Color avatarColorTrue = Colors.green;
//
  IconData iconeStatus2 = Icons.access_time_outlined;
  double avatarSize2 = 35;
  Color avatarColor2 = parseColor("#FCD5CE");
  Color iconColor2 = Colors.white;
  double iconeSize2 = 35;
  static bool state2 = true; //as controller
  String? stt2 = state2 ? "Ready" : "Waiting . . .";
  IconData iconeStatusTrue2 = Icons.check;
  double iconeSizeTrue2 = 40;
  double avatarSizeTrue2 = 40;
  Color avatarColorTrue2 = Colors.green;
//
  IconData iconeStatus3 = Icons.access_time_outlined;
  double avatarSize3 = 35;
  Color avatarColor3 = parseColor("#FCD5CE");
  Color iconColor3 = Colors.white;
  double iconeSize3 = 35;
  static bool state3 = false; //as controller
  String? stt3 = state3 ? "Ready" : "Waiting . . .";
  IconData iconeStatusTrue3 = Icons.check;
  double iconeSizeTrue3 = 40;
  double avatarSizeTrue3 = 40;
  Color avatarColorTrue3 = Colors.green;
  @override
  Widget build(BuildContext context) {
    if (state == false) {
      state2 = false;
    }
    if (state2 == false) {
      state3 = false;
    }
    return Scaffold(
      backgroundColor: parseColor("#F8EDEB"),
      appBar: AppBar(
        title: const Text(
          "order status",
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Icon(
                    state ? iconeStatusTrue : iconStatus,
                    size: state ? iconeSizeTrue : iconeSize,
                  ),
                  radius: state ? avatarSizeTrue : avatarSize,
                  backgroundColor: state ? avatarColorTrue : avatarColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const Tooltip(
                      message:
                          "here you can recieve your order Confirmation from the Manager",
                      child: Text(
                        "order confirme",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("$stt"),
                  ],
                )
              ],
            ),
            const SizedBox(
              child: VerticalDivider(
                color: Colors.black,
                thickness: 5.0,
              ),
              height: 100,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  child: Icon(state2 ? iconeStatusTrue2 : iconeStatus2,
                      size: state2 ? iconeSizeTrue2 : iconeSize2),
                  radius: state2 ? avatarSizeTrue2 : avatarSize2,
                  backgroundColor: state2 ? avatarColorTrue2 : avatarColor2,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const Tooltip(
                      message: "Here you can track your Orderd food Status",
                      child: Text(
                        "Foods Status",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("$stt2"),
                  ],
                )
              ],
            ),
            const SizedBox(
              child: VerticalDivider(
                color: Colors.black,
                thickness: 5.0,
              ),
              height: 100,
            ),
            Row(
              children: [
                CircleAvatar(
                  child: Icon(state3 ? iconeStatusTrue3 : iconeStatus3,
                      size: state3 ? iconeSizeTrue3 : iconeSize3),
                  radius: state3 ? avatarSizeTrue3 : avatarSize3,
                  backgroundColor: state3 ? avatarColorTrue3 : avatarColor3,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const Tooltip(
                      message: "Here you can track your order Delivery",
                      child: Text(
                        "Delivery Status",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("$stt3"),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
