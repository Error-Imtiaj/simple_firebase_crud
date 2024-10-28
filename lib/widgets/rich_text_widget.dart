import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';

class RichTextWidget extends StatelessWidget {
  final String? mainText;
  final String? buttontext;
  final Function()? onTap;

  const RichTextWidget({super.key, this.mainText, this.buttontext, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "${mainText} ",
            style: TextStyle(fontSize: 14, color: AppColor.blupurple),
          ),
          TextSpan(
            text: buttontext,
            style: TextStyle(
                fontSize: 16,
                color: AppColor.blupurple,
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
