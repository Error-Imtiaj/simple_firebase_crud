import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:simple_firebase_crud/auth%20services/auth_services.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
import 'package:simple_firebase_crud/widgets/app_appbar.dart';
import 'package:simple_firebase_crud/widgets/app_text_field_widget.dart';
import 'package:simple_firebase_crud/widgets/material_button.dart';
import 'package:simple_firebase_crud/widgets/rich_text_widget.dart';
import 'package:simple_firebase_crud/widgets/title_text.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegister;

  const LoginScreen({super.key, required this.showRegister});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: "Login Now",
      ),
      body: Form(
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
                validator: (p0) => validateEmail(p0),
              ),
              Gap(20),

              // PASSWORD FIELD
              AppTextFieldWidget(
                hintText: "Password",
                textEditingController: passCtrl,
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                validator: (p0) => validatePassword(p0),
              ),
              Gap(20),

              // BUTTON
              AppMaterialButton(
                buttonName: "Sign In",
                buttonColor: AppColor.purple,
                textColor: Colors.white,
                ontap: () {
                  if (_formkey.currentState!.validate()) {
                    AuthServices.signInwithFirebase(
                      context,
                      emailCtrl.text.trim(),
                      passCtrl.text,
                    );
                  }
                },
              ),
              Gap(10),
              // RICH TEXT WITH TEXT BUTTON
              RichTextWidget(
                mainText: "Don't have an account?",
                buttontext: "Create One",
                onTap: widget.showRegister,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email can not be empty';
    } else if (!value.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password can not be empty';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }
}