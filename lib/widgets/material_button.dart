
import 'package:flutter/material.dart';

class AppMaterialButton extends StatelessWidget {
  final Function()? ontap; 
  final String? buttonName;
  final Color? buttonColor;
  const AppMaterialButton({super.key, this.ontap, this.buttonName, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:ontap ,
      color: buttonColor,
      child: Text(buttonName!),
    );
  }
}
