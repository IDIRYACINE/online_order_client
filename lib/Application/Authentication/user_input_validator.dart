// ignore_for_file: unused_local_variable

import 'package:online_order_client/Infrastructure/Exceptions/auth_exceptions.dart';

class UserInputValidtor {
  static bool validateEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static bool validatePassword(String password) {
    if (password.length < 8) {
      throw WeakPassword();
    }
    return true;
  }

  static bool validatePhoneNumber(String number) {
    if (number.length < 8) {
      throw InvalidNumber();
    }
    bool numberValid = RegExp(r"^0[5|6|7].[1-9]+").hasMatch(number);
    return true;
  }

  static bool _validateName(String name) {
    bool validName = true;
    return validName;
  }

  static bool validateRegistrationData(
      String fullName, String email, String password, String phoneNumber) {
    return _validateName(fullName) &&
        validatePhoneNumber(phoneNumber) &&
        validatePassword(password) &&
        validateEmail(email);
  }
}
