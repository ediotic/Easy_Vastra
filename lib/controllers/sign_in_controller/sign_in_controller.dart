// ignore_for_file: unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/strings/app_strings.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// for password visibility
  var isPasswordVisible = true.obs;
  void toggleObscureText() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// using getx pacakge

  Future<UserCredential?> signInMethod(
    String userEmail,
    String userPassword,
  ) async {
    try {
      EasyLoading.show(status: AppStrings.pleaseWait);
      final UserCredential  userCredential =
          await _auth.signInWithEmailAndPassword(
              email: userEmail, password: userPassword);
           EasyLoading.dismiss();
          return userCredential;

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
