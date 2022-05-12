import 'package:flutter/widgets.dart';
import 'package:online_order_client/Infrastructure/Exceptions/auth_exceptions.dart';

class AuthenticationErrorHandler {
  late BuildContext _context;

  void setBuildContext(BuildContext context) {
    _context = context;
  }

  void handleErrors(String code) {
    switch (code) {
      case InvalidLoginInfos.errorCode:
        {}
        break;
      case EmailAlreadyUsed.errorCode:
        {}
        break;
      default:
        {}
    }
  }
}
