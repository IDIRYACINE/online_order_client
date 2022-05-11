// ignore_for_file: unused_local_variable

class UserInputValidtor {
  static bool _checkNull(String? value) => value == null;
  static bool _checkLength(String value) => value.length < 8;

  static const _nullValue = "Value can't be empty";
  static const _shortValue = "Must contain 8 or more characters";
  static const _invalidEmail = "Invalid Email";
  static const _invalidPhone = "_Invalid Phone Number";

  static String? validateUsername(String? value) {
    if (!_checkNull(value)) {
      return _nullValue;
    } else if (!RegExp(
            r"^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$")
        .hasMatch(value!)) {
      return _invalidEmail;
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (_checkNull(value)) {
      return _nullValue;
    } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value!)) {
      return _invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (_checkNull(value)) {
      return _nullValue;
    } else if (!_checkLength(value!)) {
      return _shortValue;
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (_checkNull(value)) {
      return _nullValue;
    } else if (!RegExp(r"^0[5|6|7].[1-9]+").hasMatch(value!)) {
      return _invalidPhone;
    }
    return null;
  }
}
