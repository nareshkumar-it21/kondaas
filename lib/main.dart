import 'package:flutter/material.dart';
import 'package:kondaas/login/login.dart';
import 'package:kondaas/screens/HomeScreen.dart';
import 'package:kondaas/login/welcome.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
         home: WelcomePage()),
    );

  }
}
