import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
import 'package:simple_firebase_crud/utils/box_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        actions: [
          IconButton.filled(
              onPressed: () {
                Get.changeTheme(ThemeData.dark());
                setState(() {});
              },
              icon: const Icon(
                Icons.sunny,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: AppBoxDecoration,
                  child: TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "Email",
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
