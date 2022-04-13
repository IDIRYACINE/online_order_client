import 'package:flutter/material.dart';

Future<dynamic> sendCodeAlert(BuildContext context, String message) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red[50],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Text(message),
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
      });
}
