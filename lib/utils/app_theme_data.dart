import 'package:flutter/material.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';

ThemeData AppThemeData = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: AppColor.blupurple,
      fontWeight: FontWeight.bold,
    ),
  ),
);
