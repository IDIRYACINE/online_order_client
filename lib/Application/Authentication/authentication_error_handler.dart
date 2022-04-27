import 'package:flutter/widgets.dart';
import 'package:online_order_client/Infrastructure/Exceptions/auth_exceptions.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';

class AuthenticationErrorHandler {
  late BuildContext _context;

  void setBuildContext(BuildContext context) {
    _context = context;
  }

  void handleErrors(String code) {
    switch (code) {
      case InvalidLoginInfos.errorCode:
        {
          sendCodeAlert(_context, "Incorrect password or email");
        }
        break;
      case EmailAlreadyUsed.errorCode:
        {
          sendCodeAlert(_context, "Email Already used");
        }
        break;
      default:
        {
          sendCodeAlert(_context, "You are offline");
        }
    }
  }
}
