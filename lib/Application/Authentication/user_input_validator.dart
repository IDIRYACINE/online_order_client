// ignore_for_file: unused_local_variable

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:online_order_client/Infrastructure/Exceptions/auth_exceptions.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';

class UserInputValidtor {
  static bool validateEmail(BuildContext context, String val, String empty,
      String invalid, String seccus) {
    if (val.isEmpty) {
      sendCodeAlert(context, empty);
      return false;
    } else if (!EmailValidator.validate(val, true)) {
      sendCodeAlert(context, invalid);
      return false;
    } else {
      sendCodeAlert(context, seccus);
      return true;
    }
  }

  static bool validatePassword(String password) {
    if (password.length < 8) {
      throw WeakPassword();
    }
    return true;
  }

  static bool validatePhoneNumber(String number) {
    if (number.length < 8) {
      return false;
    }
    bool numberValid = RegExp(r"^0[5|6|7].[1-9]+").hasMatch(number);
    return numberValid;
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
        EmailValidator.validate(email);
  }
}
