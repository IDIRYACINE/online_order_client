import 'custom_exception.dart';

class InvalidLoginInfos extends CustomException {
  static const errorCode = "invalid-login";

  InvalidLoginInfos(
      {String code = errorCode,
      String message = "Incorrect password or email",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class InvalidVerificationCode extends CustomException {
  static const errorCode = "invalid-code";

  InvalidVerificationCode(
      {String code = errorCode,
      String message = "Incorrect verification code",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class EmailAlreadyUsed extends CustomException {
  static const errorCode = "used-email";

  EmailAlreadyUsed(
      {String code = errorCode,
      String message = "Email already used , try requesting validation email",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class InvalidUser extends CustomException {
  static const errorCode = "invalid-user";

  InvalidUser(
      {String code = errorCode,
      String message = "User doesn't exist",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class InvalidEmail extends CustomException {
  static const errorCode = "invalid-login";

  InvalidEmail(
      {String code = errorCode,
      String message = "Invalid email",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class WeakPassword extends CustomException {
  static const errorCode = "invalid-password";

  WeakPassword(
      {String code = errorCode,
      String message = "Password should be at least 8 characters long",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class InvalidNumber extends CustomException {
  static const errorCode = "invalid-phone";

  InvalidNumber(
      {String code = errorCode,
      String message = "Invalid phone number",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class AccountAlreadyLinked extends CustomException {
  static const errorCode = "account-already-linked";

  AccountAlreadyLinked(
      {String code = errorCode,
      String message = "Account already linked",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}
