import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/strings/app_strings.dart';
import '../common_widgets/text_fields/fields.dart';
import '../sign_in/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return GestureDetector(
        child: Scaffold(
          backgroundColor: AppConstants.appBgColor,
          appBar: AppBar(
            backgroundColor: AppConstants.appMainColor,
            title: const Text(
              AppStrings.signUp,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppConstants.appTextColor),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height / 40,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: const Text(
                        AppStrings.welcome,
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                      )),
        
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
                  // user name
                  const Fields(
                    hintText: AppStrings.userName,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.person_2,
                    cursorColor: AppConstants.appSecondaryColor,
                  ),
                  // user city
                  const Fields(
                    hintText: AppStrings.city,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.location_city_outlined,
                    cursorColor: AppConstants.appSecondaryColor,
                  ),
                  // Phone
                  const Fields(
                    hintText: AppStrings.phone,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.phone_android_outlined,
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
                          AppStrings.signUp,
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
                        AppStrings.alreadyAccount,
                        style: TextStyle(color: AppConstants.appSecondaryColor),
                      ),
                      InkWell(
                        onTap: () => Get.offAll(() => const SignInScreen()),
                        child: const Text(
                          AppStrings.signIn,
                          style: TextStyle(
                              color: AppConstants.appSecondaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
