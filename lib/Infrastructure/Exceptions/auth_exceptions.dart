import 'custom_exception.dart';

class InvalidLoginInfos extends CustomException {
  InvalidLoginInfos(
      {String code = "Invalid-login-infos",
      String message = "Incorrect password or email",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class InvalidVerificationCode extends CustomException {
  InvalidVerificationCode(
      {String code = "Invalid-code",
      String message = "Incorrect verification code",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class EmailAlreadyUsed extends CustomException {
  EmailAlreadyUsed(
      {String code = "Email-used",
      String message = "Email already used , try requesting validation email",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class InvalidUser extends CustomException {
  InvalidUser(
      {String code = "User-not-exist",
      String message = "User doesn't exist",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class InvalidEmail extends CustomException {
  InvalidEmail(
      {String code = "Invalid-email",
      String message = "Invalid email",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class WeakPassword extends CustomException {
  WeakPassword(
      {String code = "Invalid-password",
      String message = "Password should be at least 8 characters long",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class InvalidNumber extends CustomException {
  InvalidNumber(
      {String code = "Invalid-phone-number",
      String message = "Invalid phone number",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class AccountAlreadyLinked extends CustomException {
  AccountAlreadyLinked(
      {String code = "Account-already-linked",
      String message = "Account already linked",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}
