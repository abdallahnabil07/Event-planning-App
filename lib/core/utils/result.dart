import 'package:event_app/core/enums/auth_error_code.dart';

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final Object code;
  const Failure(this.code);
}
