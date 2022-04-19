import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';


Color parseColor(String color) {
  String hex = color.replaceAll("#", "");
  if (hex.isEmpty) hex = "ffffff";
  if (hex.length == 3) {
    hex =
        '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
  }
  Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
  return col;
}

class CustomTitle extends StatelessWidget {
  final String _title;
  final double _size;
  final double _lineHeight;

  // ignore: use_key_in_widget_constructors
  const CustomTitle(this._title, [this._size = 30, this._lineHeight = 3.0]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Row(children: [
          Text(
            _title,
            style: TextStyle(
              fontSize: _size,
              fontWeight: FontWeight.bold,
              fontFamily: "Lobster",
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Expanded(
            child: Container(
              height: _lineHeight,
              color: Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}
class EmailValid extends StatefulWidget {
  const EmailValid({ Key? key }) : super(key: key);

  @override
  State<EmailValid> createState() => _EmailValidState();
}

class _EmailValidState extends State<EmailValid> {
  @override
  Widget build(BuildContext context) {
    void validateEmail(BuildContext context,
        String val, String empty, String invalid, String seccus) {
      if (val.isEmpty) {
        setState(() {
          sendCodeAlert(context, empty);
        });
      } else if (!EmailValidator.validate(val, true)) {
        setState(() {
          sendCodeAlert(context, invalid);
        });
      } else {
        setState(() {
          sendCodeAlert(context, seccus);
        });
      }
    }
    return Container(
      
    );
  }
}
