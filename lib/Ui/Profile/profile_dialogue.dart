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
    String? hint;
    Icon? icon;
    return Form(
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
                  prefixIcon: icon
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
