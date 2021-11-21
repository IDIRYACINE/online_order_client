import 'dart:ui';

abstract class AuthException implements Exception {
  AuthException({this.code = "unkown", this.message, this.stackTrace});

  final String code;
  final String? message;
  final StackTrace? stackTrace;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthException) return false;
    return other.hashCode == hashCode;
  }

  @override
  int get hashCode => hashValues(code, message);

  @override
  String toString() {
    String output = '[$code] $message';
    if (stackTrace != null) {
      output += '\n\n${stackTrace.toString()}';
    }

    return output;
  }
}

class InvalidLoginInfos extends AuthException {
  InvalidLoginInfos(
      {String code = "Invalid-login-infos",
      String message = "Incorrect password or email",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class InvalidVerificationCode extends AuthException {
  InvalidVerificationCode(
      {String code = "Invalid-code",
      String message = "Incorrect verification code",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class EmailAlreadyUsed extends AuthException {
  EmailAlreadyUsed(
      {String code = "Email-used",
      String message = "Email already used , try requesting validation email",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class InvalidUser extends AuthException {
  InvalidUser(
      {String code = "User-not-exist",
      String message = "User doesn't exist",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}
