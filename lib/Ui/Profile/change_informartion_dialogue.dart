import 'package:flutter/material.dart';

Future<dynamic> changeElementPoupUp(
    BuildContext context,
    Widget title,
    Function onConfirmed,
    String hint,
    Icon icon,
    TextEditingController controller) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red[50],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 80,
                child: Form(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 220,
                          child: TextFormField(
                            controller: controller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: hint,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                prefixIcon: icon),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              )),
          title: title,
          actions: [
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  onConfirmed;
                  Navigator.of(context).pop();
                },
                child: const Text("Confirm"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
              width: 200,
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Exit"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
}
