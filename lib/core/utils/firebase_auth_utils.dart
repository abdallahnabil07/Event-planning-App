import 'package:eventy_app/core/enums/auth_error.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthUtils {
  static Future<AuthError?> signInWithEmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return AuthError.invalidCredential;
      } else if (e.code == 'wrong-password') {
        return AuthError.wrongPassword;

      }
      return null;
    }
  }

  static Future<AuthError?> signUpWithEmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {
        return AuthError.emailAlreadyInUse;
      }
      return null;
    } catch (e) {
      return AuthError.unKnown;
    }
  }
}
