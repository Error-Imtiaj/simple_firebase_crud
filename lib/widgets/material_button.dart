import 'package:flutter/material.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';

class AppMaterialButton extends StatelessWidget {
  final Function()? ontap;
  final String? buttonName;
  final Color? buttonColor;
  final Color? textColor;
  const AppMaterialButton({
    super.key,
    this.ontap,
    this.buttonName,
    this.buttonColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ontap,
      color: buttonColor,
      child: Text(
        buttonName!,
        style: TextStyle(color: textColor ?? Colors.black),
      ),
    );
  }
}
