import 'package:flutter/material.dart';
import 'package:simple_firebase_crud/screens/login_screen.dart';
import 'package:simple_firebase_crud/screens/signup_screen.dart';

class AuthState extends StatefulWidget {
  const AuthState({super.key});

  @override
  State<AuthState> createState() => _AuthStateState();
}

class _AuthStateState extends State<AuthState> {
  bool showLoginPage = true;
  void toogle() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(
        showRegister: toogle,
      );
    } else {
      return SignupScreen(
        showLogin: toogle,
      );
    }
  }
}
