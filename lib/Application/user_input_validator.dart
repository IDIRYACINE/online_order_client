import 'package:online_order_client/Infrastructure/Exceptions/exceptions.dart';

class UserInputValidtor {
  bool _validateEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
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
    return numberValid;
  }

  bool _validateName(String name) {
    bool validName = true;
    return validName;
  }

  bool validateNewAccountRegistration(String firstName, String lastName,
      String email, String password, String phoneNumber) {
    bool validFullName = _validateName(firstName) && _validateName(lastName);

    return validFullName &&
        _validatePhoneNumber(phoneNumber) &&
        _validatePassword(password) &&
        _validateEmail(email);
  }
}
