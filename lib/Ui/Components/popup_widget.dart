import 'package:flutter/material.dart';

class PopUpWidget extends StatelessWidget {
  final String _title;
  final String _message;
  const PopUpWidget(this._title, this._message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(_message),
          MaterialButton(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
