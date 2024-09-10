// ignore_for_file: unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../screens/auth_ui/onboading/sign_in/sign_in_screen.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/strings/app_strings.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// using getx pacakge

  Future<void> forgetPasswordMethod(
    String userEmail,
  ) async {
    try {
      EasyLoading.show(status: AppStrings.pleaseWait);

      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
        AppStrings.requestSent,
       "${AppStrings.passwordLinkSent}$userEmail",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstants.appSecondaryColor,
        colorText: AppConstants.appTextColor,
        borderColor: AppConstants.appMainColor,
      );
      Get.offAll(() => const SignInScreen());

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        AppStrings.error,
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstants.appSecondaryColor,
        colorText: AppConstants.appTextColor,
        borderColor: AppConstants.appMainColor,
      );
    }
    return null;
  }
}
