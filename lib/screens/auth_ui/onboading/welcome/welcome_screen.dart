import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/google_sign_in/google_sign_in.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/strings/app_strings.dart';
import '../sign_in/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.appBgColor,
      appBar: AppBar(
        backgroundColor: AppConstants.appMainColor,
        title: const Text(
          AppStrings.welcome,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppConstants.appTextColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Lottie animation
            Container(
              color: AppConstants.appMainColor,
              height: Get.height / 2,
              width: double.infinity,
              child: Lottie.asset(AppConstants.splashLogo),
            ),
            const SizedBox(height: 20),
            // Happy shopping text
            const Text(
              AppStrings.happyShopping,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: Get.height / 12,
            ),
            // Google sign-in button
            Material(
              child: Container(
                width: Get.width / 1.3,
                height: Get.height / 16,
                decoration: BoxDecoration(
                  color: AppConstants.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20.5),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    _googleSignInController.signInWithGoogle();
                  },
                  icon: Image.asset(AppConstants.googleLogo),
                  label: const Text(
                    AppStrings.signInWithGoogle,
                    style: TextStyle(color: AppConstants.appTextColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            // Email sign-in button
            Material(
              child: Container(
                width: Get.width / 1.3,
                height: Get.height / 16,
                decoration: BoxDecoration(
                  color: AppConstants.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20.5),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    Get.to(() => const SignInScreen());
                  },
                  icon: const Icon(
                    Icons.email_sharp,
                    color: AppConstants.appTextColor,
                    size: 25,
                  ),
                  label: const Text(
                    AppStrings.signInWithEmail,
                    style: TextStyle(color: AppConstants.appTextColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
