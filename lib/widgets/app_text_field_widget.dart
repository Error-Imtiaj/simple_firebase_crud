import 'package:flutter/material.dart';
import 'package:simple_firebase_crud/utils/box_decoration.dart';

class AppTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final IconButton? suffixIcon;

  const AppTextFieldWidget({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.obscureText,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration,
      child: TextFormField(
        validator: validator,
        obscureText: obscureText ?? false,
        controller: textEditingController,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
