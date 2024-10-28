import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:simple_firebase_crud/auth%20services/auth_services.dart';
import 'package:simple_firebase_crud/screens/login_screen.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
import 'package:simple_firebase_crud/utils/navigator.dart';
import 'package:simple_firebase_crud/widgets/app_appbar.dart';
import 'package:simple_firebase_crud/widgets/app_text_field_widget.dart';
import 'package:simple_firebase_crud/widgets/material_button.dart';
import 'package:simple_firebase_crud/widgets/rich_text_widget.dart';
import 'package:simple_firebase_crud/widgets/snackbar.dart';
import 'package:simple_firebase_crud/widgets/title_text.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback showLogin;
  const SignupScreen({super.key, required this.showLogin});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController cPassCtrl = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    emailCtrl.dispose();
    passCtrl.dispose();
    cPassCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppbar(
        title: "Register Now",
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TITLE
              const TitleText(
                title: "Get started",
              ),
              const Gap(20),

              // EMAIL FIELD
              AppTextFieldWidget(
                hintText: "Email",
                textEditingController: emailCtrl,
              ),
              const Gap(20),

              // PASSWORD FIELD
              AppTextFieldWidget(
                hintText: "Password",
                textEditingController: passCtrl,
                obsecureText: true,
              ),
              const Gap(20),

              // CONFIRM PASSWORD FIELD
              AppTextFieldWidget(
                hintText: " Confirm Password",
                textEditingController: cPassCtrl,
                obsecureText: true,
              ),
              const Gap(20),

              // BUTTON
              Visibility(
                visible: !isLoading,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: AppMaterialButton(
                  buttonName: "Sign up",
                  buttonColor: AppColor.purple,
                  textColor: Colors.white,
                  ontap: () {
                    _createAccount();
                  },
                ),
              ),
              const Gap(10),
              // RICH TEXT WITH TEXT BUTTON
              RichTextWidget(
                mainText: "Have an account?",
                buttontext: "login now",
                onTap: widget.showLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createAccount() async {
    isLoading = true;
    setState(() {});
    await AuthServices.signUpWithFirebase(
        context, emailCtrl.text, passCtrl.text);
    isLoading = false;
    setState(() {});
    showSnackbar(context, "Congratultions! you have successfully signed up");
  }
}
