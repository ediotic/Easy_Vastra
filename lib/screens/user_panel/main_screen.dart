// import 'package:easy_vastra/utils/constants/app_constants.dart';
// import 'package:easy_vastra/screens/auth_ui/onboading/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/constants/app_constants.dart';
import '../auth_ui/onboading/welcome/welcome_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: AppConstants.appMainColor,
        title: const Text(AppConstants.appMainName , style: TextStyle( color: AppConstants.appTextColor),),
        centerTitle: true,
        actions: [
           GestureDetector(
            onTap: () async {
               GoogleSignIn googleSignIn =GoogleSignIn();
               FirebaseAuth _auth = FirebaseAuth.instance;
               
              await googleSignIn.signOut();
              await _auth.signOut();
               Get.offAll(() => WelcomeScreen());
            },
            child: const Padding(
               padding: EdgeInsets.all(8),
              child: Icon(Icons.logout)))
        ],
       ),
    );
  }
}