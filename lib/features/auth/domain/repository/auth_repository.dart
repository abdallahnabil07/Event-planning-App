import 'package:event_app/core/enums/auth_error.dart';
import 'package:event_app/core/utils/result.dart';

abstract class AuthRepository {
  /// Signs in an existing user with email and password.
  /// Returns null on success, or an [AuthError] on failure.
  Future<Result<void>> signIn(String email, String password);

  /// Creates a new user account with email and password.
  /// Returns null on success, or an [AuthError] on failure.
  Future<Result<void>> signUp(String email, String password);

  /// Sends a password reset email to the given address.
  /// Returns null on success, or an [AuthError] on failure.
  Future<Result<void>> forgetPassword(String email);

  Future<Result<void>> signInWithGoogle();
}
