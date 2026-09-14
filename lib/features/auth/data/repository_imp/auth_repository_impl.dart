import 'package:event_app/core/enums/auth_error_code.dart';
import 'package:event_app/core/utils/result.dart';
import 'package:event_app/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepositoryImpl({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  @override
  Future<Result<void>> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return Failure(_mapFirebaseError(e));
    } catch (e) {
      return const Failure(AuthErrorCode.unknown);
    }
  }

  @override
  Future<Result<void>> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return Failure(_mapFirebaseError(e));
    } catch (e) {
      return const Failure(AuthErrorCode.unknown);
    }
  }

  @override
  Future<Result<void>> forgetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return Failure(_mapFirebaseError(e));
    } catch (e) {
      return const Failure(AuthErrorCode.unknown);
    }
  }

  @override
  Future<Result<void>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return const Success(null);
    } on GoogleSignInException catch (e) {
      debugPrint('❌ GoogleSignInException: ${e.code} — ${e.description}'); // ✅
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return const Failure(AuthErrorCode.signInCancelled);
      }
      return const Failure(AuthErrorCode.unknown);
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ FirebaseAuthException: ${e.code} — ${e.message}'); // ✅
      return Failure(_mapFirebaseError(e));
    } catch (e) {
      debugPrint('❌ Unknown error: $e'); // ✅
      return const Failure(AuthErrorCode.unknown);
    }
  }

  AuthErrorCode _mapFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return AuthErrorCode.userNotFound;
      case 'wrong-password':
        return AuthErrorCode.wrongPassword;
      case 'invalid-credential':
        return AuthErrorCode.invalidCredential;
      case 'email-already-in-use':
        return AuthErrorCode.emailAlreadyInUse;
      case 'weak-password':
        return AuthErrorCode.weakPassword;
      case 'invalid-email':
        return AuthErrorCode.invalidEmail;
      default:
        return AuthErrorCode.unknown;
    }
  }
}
