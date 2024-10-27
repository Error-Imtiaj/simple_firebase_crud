import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_firebase_crud/screens/home_screen.dart';
import 'package:simple_firebase_crud/screens/login_screen.dart';
import 'package:simple_firebase_crud/utils/app_theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
