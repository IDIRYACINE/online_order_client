import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Components/components.dart';

class ChangeElementProfile extends StatefulWidget {
  const ChangeElementProfile({Key? key}) : super(key: key);

  @override
  _ChangeElementProfileState createState() => _ChangeElementProfileState();
}

class _ChangeElementProfileState extends State<ChangeElementProfile> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 150,
        child: Column(
          children: [
            SizedBox(
              width: 220,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "current Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: parseColor("#FFB5A7"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 220,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "new adresse Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: parseColor("#FFB5A7"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
