import 'package:online_order_client/Infrastructure/Exceptions/auth_exceptions.dart';

class UserInputValidtor {
  bool _validateEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return true;
  }

  bool _validatePassword(String password) {
    if (password.length < 8) {
      throw WeakPassword();
    }
    return true;
  }

  bool _validatePhoneNumber(String number) {
    if (number.length < 8) {
      throw InvalidNumber();
    }
    bool numberValid = RegExp(r"^0[5|6|7].[1-9]+").hasMatch(number);
    return true;
  }

  bool _validateName(String name) {
    bool validName = true;
    return validName;
  }

  bool validateRegistrationData(
      String fullName, String email, String password, String phoneNumber) {
    return _validateName(fullName) &&
        _validatePhoneNumber(phoneNumber) &&
        _validatePassword(password) &&
        _validateEmail(email);
  }
}
