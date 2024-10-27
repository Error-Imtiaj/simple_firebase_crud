import 'package:flutter/material.dart';
import 'package:simple_firebase_crud/utils/box_decoration.dart';

class AppTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool? obsecureText;
  final String? Function(String?)? validator;
  const AppTextFieldWidget({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.obsecureText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration,
      child: TextFormField(
        validator: validator,
        obscureText: obsecureText ?? false,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
