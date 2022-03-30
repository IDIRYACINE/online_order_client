import 'custom_exception.dart';

class NetworkError extends CustomException {
  NetworkError(
      {String code = "Network-error",
      String message = "A netowrk error occured",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class OrderNotSent extends CustomException {
  OrderNotSent(
      {String code = "Order-not-sent",
      String message = "Order couldn't be placed , try again later!",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class OrderNotFound extends CustomException {
  OrderNotFound(
      {String code = "Order-not-found",
      String message = "Order couldn't be found ",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class LocalDatabaseNotFound extends CustomException {
  LocalDatabaseNotFound(
      {String code = "Local-database-not-found",
      String message = "Database couldn't be found ",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}

class RemoteDatabaseNotFound extends CustomException {
  RemoteDatabaseNotFound(
      {String code = "Remote-database-not-found",
      String message = "Database couldn't be found ",
      StackTrace? stackTrace})
      : super(code: code, message: message, stackTrace: stackTrace);
}
