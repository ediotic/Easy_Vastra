// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../controllers/forget_password_controller/forget_password_controller.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/strings/app_strings.dart';
import '../../../user_panel/main_screen.dart';
import '../signup/sign_up_screen.dart';
import '../common_widgets/text_fields/fields.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        backgroundColor: AppConstants.appBgColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConstants.appMainColor,
          title: const Text(
            AppStrings.forgetPassword,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppConstants.appTextColor),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              // Check if the keyboard is visible, adjust layout accordingly
              if (!isKeyboardVisible)
                Expanded(
                  // we can also use colum here to erite text
                  child: Container(
                    width: double.infinity,
                    height: Get.height / 2.5,
                    color: AppConstants.appMainColor,
                    child: Lottie.asset(AppConstants.splashLogo),
                  ),
                ),
              SizedBox(
                height: Get.height / 12,
              ),
              // email
              Fields(
                controller: userEmail,
                hintText: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
                cursorColor: AppConstants.appSecondaryColor,
              ),
              SizedBox(
                height: Get.height / 30,
              ),
              Material(
                child: Container(
                  width: Get.width / 2,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                    color: AppConstants.appSecondaryColor,
                    borderRadius: BorderRadius.circular(20.5),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      String email = userEmail.text.trim();

                      if (email.isEmpty) {
                        Get.snackbar(
                          AppStrings.error,
                          AppStrings.pleaseEnterAll,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstants.appSecondaryColor,
                          colorText: AppConstants.appTextColor,
                          borderColor: AppConstants.appMainColor,
                        );
                      } else {
                        String email= userEmail.text.trim();
                        forgetPasswordController.forgetPasswordMethod(email);
                      }
                    },
                    child: const Text(
                      AppStrings.forget,
                      style: TextStyle(color: AppConstants.appTextColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
        
              SizedBox(
                height: Get.height / 24,
              ),
            ],
          ),
        ),
      );
    });
  }
}
