import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';

void showSnackbar(BuildContext context, String message,
    [bool isError = false]) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: GoogleFonts.poppins(
          color: AppColor.white, fontSize: 16, fontWeight: FontWeight.w500),
    ),
    backgroundColor: isError ? AppColor.red : AppColor.blupurple,
    //behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: 'DISMISS',
      textColor: AppColor.white,
      onPressed: () {
        // DISMISS THE SNACKBAR
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  // SHOW THE SNACKBAR
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
