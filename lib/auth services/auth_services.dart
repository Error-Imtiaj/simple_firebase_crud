import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_firebase_crud/screens/home_screen.dart';
import 'package:simple_firebase_crud/utils/navigator.dart';
import 'package:simple_firebase_crud/widgets/snackbar.dart';

class AuthServices {
  // I N S T A N C E CALL
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // EVENT NOTIFY
  // static void notify(User? user) {
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       print('User is signed in!');
  //     }
  //   });
  // }

  // FIREBASE SIGN IN
  static Future<void> signInwithFirebase(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(context, 'No user found for that email.', true);
      } else if (e.code == 'wrong-password') {
        showSnackbar(context, 'Wrong password provided for that user.', true);
      }
    } catch (e) {
      showSnackbar(context, e.toString(), true);
    }
  }

  // FIREBASE CREATE ACCOUNT BY EMAIL / PASSWORD
  static Future<void> signUpWithFirebase(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          navigateTo(
            HomeScreen(),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(context, 'The password provided is too weak.', true);
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(
            context, 'The account already exists for that email.', true);
      }
    } catch (e) {
      showSnackbar(context, e.toString(), true);
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
    } catch (e) {
      showSnackbar(context, e.toString(), true);
    }
  }

  // DELETE USER
  static Future<void> deleteUser(User? user, BuildContext context) async {
    try {
      await user?.delete();
    } catch (e) {
      showSnackbar(context, e.toString(), true);
    }
  }
}

// ========================================================
// DONT WRITE BELOW THIS

// ! COMMENTS
/* 
  ?REQUIRED DEPENDENCY 
  * - FIREBASE AUTH
  * - FIREBASE CORE 
*/

// =======================================================
// ========================================================
