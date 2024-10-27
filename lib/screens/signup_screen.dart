import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
import 'package:simple_firebase_crud/widgets/app_appbar.dart';
import 'package:simple_firebase_crud/widgets/app_text_field_widget.dart';
import 'package:simple_firebase_crud/widgets/material_button.dart';
import 'package:simple_firebase_crud/widgets/title_text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController cPassCtrl = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
      appBar: AppAppbar(),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TITLE
              TitleText(
                title: "Get started",
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

              // CONFIRM PASSWORD FIELD
              AppTextFieldWidget(
                hintText: " Confirm Password",
                textEditingController: cPassCtrl,
                obsecureText: true,
              ),
              Gap(20),

              // BUTTON
              AppMaterialButton(
                buttonName: "Sign up",
                buttonColor: AppColor.purple,
                textColor: Colors.white,
                ontap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
