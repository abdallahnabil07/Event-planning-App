import 'package:bloc/bloc.dart';
import 'package:event_app/core/enums/auth_error_code.dart';
import 'package:event_app/core/utils/result.dart';
import 'package:event_app/features/auth/domain/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthCubit(this._repository) : super(AuthInitial());

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    final result = await _repository.signIn(email, password);
    _emitResult(result);
  }

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    final result = await _repository.signUp(email, password);
    _emitResult(result);
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    final result = await _repository.signInWithGoogle();
    _emitResult(result);
  }

  Future<void> forgetPassword(String email) async {
    emit(AuthLoading());
    final result = await _repository.forgetPassword(email);
    _emitResult(result);
  }

  void _emitResult(Result<void> result) {
    switch (result) {
      case Success():
        emit(AuthSuccess());
      case Failure(:final code):
        emit(AuthFailureState(code as AuthErrorCode));
    }
  }
}
