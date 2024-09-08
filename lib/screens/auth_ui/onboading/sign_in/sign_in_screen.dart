import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/strings/app_strings.dart';
import '../signup/sign_up_screen.dart';
import '../common_widgets/text_fields/fields.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        backgroundColor: AppConstants.appBgColor,
        appBar: AppBar(
          backgroundColor: AppConstants.appMainColor,
          title: const Text(
            AppStrings.signIn,
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
              const Fields(
                hintText: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
                cursorColor: AppConstants.appSecondaryColor,
              ),
              // password
              const Fields(
                hintText: AppStrings.password,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Icons.password_outlined,
                suffixIcon: Icons.visibility_off,
                cursorColor: AppConstants.appSecondaryColor,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 28),
                alignment: Alignment.centerRight,
                child: const Text(
                  AppStrings.forgetPassword,
                  style: TextStyle(
                      color: AppConstants.appSecondaryColor,
                      fontWeight: FontWeight.w500),
                ),
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
                    onPressed: () {},
                    child: const Text(
                      AppStrings.signIn,
                      style: TextStyle(color: AppConstants.appTextColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.dontAccount,
                    style: TextStyle(color: AppConstants.appSecondaryColor),
                  ),
                  InkWell(
                    onTap: () => Get.offAll(() => const SignUpScreen()),
                    child: const Text(
                      AppStrings.signUp,
                      style: TextStyle(
                          color: AppConstants.appSecondaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
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
