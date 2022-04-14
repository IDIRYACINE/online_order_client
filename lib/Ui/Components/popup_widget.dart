import 'package:flutter/material.dart';

class _PopUpWidget extends StatelessWidget {
  final String _message;
  const _PopUpWidget(this._message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red[50],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Text(_message),
      actions: [
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Confirm"),
            style: ElevatedButton.styleFrom(primary: Colors.green),
          ),
          width: 200,
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}

Future<dynamic> sendCodeAlert(BuildContext context, String message) async {
  return showDialog(
      context: context,
      builder: (context) {
        return _PopUpWidget(message);
      });
}
