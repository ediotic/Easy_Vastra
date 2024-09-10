// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import '../../../../controllers/sign_up_controller.dart/sign_up_controller.dart';
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
  final SignUpController signUpController = Get.put(SignUpController());        /// dependencies injection
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userPassward = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return GestureDetector(
        child: Scaffold(
          backgroundColor: AppConstants.appBgColor,
          appBar: AppBar(
            centerTitle: true,
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
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      )),

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
                  // user name
                  Fields(
                    controller: userName,
                    hintText: AppStrings.userName,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.person_2,
                    cursorColor: AppConstants.appSecondaryColor,
                  ),
                  // user city
                  Fields(
                    controller: userCity,
                    hintText: AppStrings.city,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.location_city_outlined,
                    cursorColor: AppConstants.appSecondaryColor,
                  ),
                  // Phone
                  Fields(
                    controller: userPhone,
                    hintText: AppStrings.phone,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.phone_android_outlined,
                    cursorColor: AppConstants.appSecondaryColor,
                  ),
                  // password
                  Obx(
                    () => Fields(
                      controller: userPassward,
                      obscureText: signUpController.isPasswordVisible.value,
                      hintText: AppStrings.password,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.password_outlined,
                      suffixIcon: signUpController.isPasswordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onTap: (){
                        signUpController.toggleObscureText();
                      },
                      cursorColor: AppConstants.appSecondaryColor,
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
                        onPressed: ()  async{
                          String name = userName.text.trim();
                          String email = userEmail.text.trim();
                          String city = userCity.text.trim();
                          String phone = userPhone.text.trim();
                          String password = userPassward.text.trim();
                          String userDeviceToken = '';

                          if (name.isEmpty ||
                              email.isEmpty ||
                              phone.isEmpty ||
                              city.isEmpty ||
                              password.isEmpty) {
                            Get.snackbar(
                              AppStrings.error,
                              AppStrings.pleaseEnterAll,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstants.appSecondaryColor,
                              colorText: AppConstants.appTextColor,
                              borderColor: AppConstants.appMainColor,
                            );
                          }else{
                            UserCredential? userCredential = await signUpController.signUpMethod(name, email, city, phone, password, userDeviceToken);
                            if(userCredential != null){
                              Get.snackbar(
                              AppStrings.verificationEmail,
                              AppStrings.pleaseCheck,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstants.appSecondaryColor,
                              colorText: AppConstants.appTextColor,
                              borderColor: AppConstants.appMainColor,
                            );
                            FirebaseAuth.instance.signOut();
                            Get.offAll(() => const SignInScreen());
                            }
                          }
                        },
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
