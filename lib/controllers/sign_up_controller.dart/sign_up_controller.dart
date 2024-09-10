// ignore_for_file: unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../modals/user_models/user_models.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/strings/app_strings.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// for password visibility
  var isPasswordVisible = true.obs;
  void toggleObscureText() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// using getx pacakge

  Future<UserCredential?> signUpMethod(
    String userName,
    String userEmail,
    String userCity,
    String userPhone,
    String userPassward,
    String userDeviceToken,
  ) async {
    try {
      EasyLoading.show(status: AppStrings.pleaseWait);
      final UserCredential  userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassward);

      /// sent email to the user to verify onTap
      await userCredential.user!.sendEmailVerification();

      UserModels userModels = UserModels(
          uId: userCredential.user!.uid,
          userName: userName,
          email: userEmail,
          phone: userPhone,
          userImg: "",
          userDeviceToken: userDeviceToken,
          country: "",
          userAddress: "",
          street: "",
          city: userCity,
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now());

      /// add data into firebase
      _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(userModels.toMap());

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
