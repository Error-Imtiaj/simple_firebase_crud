import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
import 'package:simple_firebase_crud/widgets/app_appbar.dart';
import 'package:simple_firebase_crud/widgets/app_text_field_widget.dart';
import 'package:simple_firebase_crud/widgets/material_button.dart';
import 'package:simple_firebase_crud/widgets/title_text.dart';

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
      appBar: AppAppbar(),
      body: Center(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TITLE
                TitleText(
                  title: "Welcome Back!",
                ),
                Gap(20),

                // EMAIL FIELD
                AppTextFieldWidget(
                  hintText: "Email",
                  textEditingController: emailCtrl,
                ),
                Gap(20),

                // PASSWORD FIELD
                AppTextFieldWidget(
                  hintText: "Password",
                  textEditingController: passCtrl,
                  obsecureText: true,
                ),
                Gap(20),

                // BUTTON
                AppMaterialButton(
                  buttonName: "Sign In",
                  buttonColor: AppColor.purple,
                  textColor: Colors.white,
                  ontap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
