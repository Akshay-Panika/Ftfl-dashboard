import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/screens/auth/sign_in_screen.dart';
import 'package:ftfl_dashboard/screens/dashboard/dashboard_screen.dart';
import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: SignInScreen(),
     );
  }
}

