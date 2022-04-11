import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  IconData IconeStatus = Icons.access_time_outlined;
  double AvatarSize = 35;
  Color AvatarColor = parseColor("#FCD5CE");
  Color IconColor = Colors.white;
  double IconeSize = 35;
  static bool state = true; //as controller
  String? Stt = state ? "Ready" : "Waiting. . .";
  IconData IconeStatusTrue = Icons.check;
  double IconeSizeTrue = 40;
  double AvatarSizeTrue = 40;
  Color AvatarColorTrue = Colors.green;
//
  IconData IconeStatus2 = Icons.access_time_outlined;
  double AvatarSize2 = 35;
  Color AvatarColor2 = parseColor("#FCD5CE");
  Color IconColor2 = Colors.white;
  double IconeSize2 = 35;
  static bool state2 = true; //as controller
  String? Stt2 = state2 ? "Ready" : "Waiting . . .";
  IconData IconeStatusTrue2 = Icons.check;
  double IconeSizeTrue2 = 40;
  double AvatarSizeTrue2 = 40;
  Color AvatarColorTrue2 = Colors.green;
//
  IconData IconeStatus3 = Icons.access_time_outlined;
  double AvatarSize3 = 35;
  Color AvatarColor3 = parseColor("#FCD5CE");
  Color IconColor3 = Colors.white;
  double IconeSize3 = 35;
  static bool state3 = false; //as controller
  String? Stt3 = state3 ? "Ready" : "Waiting . . .";
  IconData IconeStatusTrue3 = Icons.check;
  double IconeSizeTrue3 = 40;
  double AvatarSizeTrue3 = 40;
  Color AvatarColorTrue3 = Colors.green;
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
                    state ? IconeStatusTrue : IconeStatus,
                    size: state ? IconeSizeTrue : IconeSize,
                  ),
                  radius: state ? AvatarSizeTrue : AvatarSize,
                  backgroundColor: state ? AvatarColorTrue : AvatarColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Tooltip(
                      message:
                          "here you can recieve your order Confirmation from the Manager",
                      child: Text(
                        "order confirme",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("$Stt"),
                  ],
                )
              ],
            ),
            SizedBox(
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
                  child: Icon(state2 ? IconeStatusTrue2 : IconeStatus2,
                      size: state2 ? IconeSizeTrue2 : IconeSize2),
                  radius: state2 ? AvatarSizeTrue2 : AvatarSize2,
                  backgroundColor: state2 ? AvatarColorTrue2 : AvatarColor2,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Tooltip(
                      message: "Here you can track your Orderd food Status",
                      child: Text(
                        "Foods Status",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("$Stt2"),
                  ],
                )
              ],
            ),
            SizedBox(
              child: VerticalDivider(
                color: Colors.black,
                thickness: 5.0,
              ),
              height: 100,
            ),
            Row(
              children: [
                CircleAvatar(
                  child: Icon(state3 ? IconeStatusTrue3 : IconeStatus3,
                      size: state3 ? IconeSizeTrue3 : IconeSize3),
                  radius: state3 ? AvatarSizeTrue3 : AvatarSize3,
                  backgroundColor: state3 ? AvatarColorTrue3 : AvatarColor3,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Tooltip(
                      message: "Here you can track your order Delivery",
                      child: Text(
                        "Delivery Status",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("$Stt3"),
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
