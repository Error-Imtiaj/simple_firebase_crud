import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_firebase_crud/auth%20services/exceptions.dart';
import 'package:simple_firebase_crud/screens/home_screen.dart';
import 'package:simple_firebase_crud/utils/navigator.dart';
import 'package:simple_firebase_crud/widgets/snackbar.dart';

class AuthServices {
  // I N S T A N C E CALL
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // EVENT NOTIFY
  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  // FIREBASE SIGN IN
  static Future<User?> signInwithFirebase(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(context, 'No user found for that email.', true);
      } else if (e.code == 'wrong-password') {
        showSnackbar(context, 'Wrong password provided for that user.', true);
      }
      return null;
    } on Exception catch (e) {
      ExceptionHandler.handleErrorAndShow(context, e);
    }
  }

  // FIREBASE CREATE ACCOUNT BY EMAIL / PASSWORD
  static Future<User?> signUpWithFirebase(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      navigateTo(HomeScreen());
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(context, 'The password provided is too weak.', true);
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(
            context, 'The account already exists for that email.', true);
      }
      return null;
    } on Exception catch (e) {
      ExceptionHandler.handleErrorAndShow(context, e);
    }
  }

  // SIGN OUT
  static Future<void> signOut() async {
    await _auth.signOut();
  }

  // RESET PASSWORD
  static Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on Exception catch (e) {
      ExceptionHandler.handleErrorAndShow(context, e);
    }
  }

  // DELETE USER
  static Future<void> deleteUser(User? user, BuildContext context) async {
    try {
      await user?.delete();
    } on Exception catch (e) {
      ExceptionHandler.handleErrorAndShow(context, e);
    }
  }
}
