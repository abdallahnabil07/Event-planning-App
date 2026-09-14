part of 'auth_cubit.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailureState extends AuthState {
  final AuthErrorCode code;

  AuthFailureState(this.code);
}
