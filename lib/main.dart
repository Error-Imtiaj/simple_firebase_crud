import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simple_firebase_crud/app.dart';
import 'package:simple_firebase_crud/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // I N I T I A L I Z E FIREBASE
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}
