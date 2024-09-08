// app root widgets

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'screens/auth_ui/onboading/signup/sign_up_screen.dart';
import 'screens/auth_ui/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of this  application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Easy Vastra',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    );
  }
}
