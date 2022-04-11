import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';

class ConfirmEmail extends StatefulWidget {
  const ConfirmEmail({Key? key}) : super(key: key);

  @override
  _ConfirmEmailState createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        width: 220,
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Confirmation Code",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            prefixIcon: Icon(
              Icons.confirmation_number,
              color: parseColor("#FFB5A7"),
            ),
          ),
        ),
      ),
    );
  }
}
