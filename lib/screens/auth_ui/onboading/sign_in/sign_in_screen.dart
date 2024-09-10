

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/sign_in_controller/sign_in_controller.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/strings/app_strings.dart';
import '../../../user_panel/main_screen.dart';
import '../forget_password_screen/forget_password_screen.dart';
import '../signup/sign_up_screen.dart';
import '../common_widgets/text_fields/fields.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
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
             Fields(
                controller: userEmail ,
                hintText: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
                cursorColor: AppConstants.appSecondaryColor,
              ),
              // password
                  Obx(
                    () => Fields(
                      controller: userPassword,
                      obscureText: signInController.isPasswordVisible.value,
                      hintText: AppStrings.password,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.password_outlined,
                      suffixIcon: signInController.isPasswordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onTap: (){
                        signInController.toggleObscureText();
                      },
                      cursorColor: AppConstants.appSecondaryColor,
                    ),
                  ),
              GestureDetector(
                onTap: (){
                  Get.to(() =>const ForgetPasswordScreen());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    AppStrings.forgetPassword,
                    style: TextStyle(
                        color: AppConstants.appSecondaryColor,
                        fontWeight: FontWeight.w500),
                  ),
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
                    onPressed: () async{
                      String email = userEmail.text.trim();
                      String password = userPassword.text.trim();


                      if(email.isEmpty || password.isEmpty){
                              Get.snackbar(
                              AppStrings.error,
                              AppStrings.pleaseEnterAll,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstants.appSecondaryColor,
                              colorText: AppConstants.appTextColor,
                              borderColor: AppConstants.appMainColor,
                            );

                      } else{
                        UserCredential? userCredential = await signInController.signInMethod(email, password);

                         if(userCredential != null){
                           if(userCredential.user!.emailVerified){
                              Get.snackbar(
                              AppStrings.success,
                              AppStrings.loginSuccess,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstants.appSecondaryColor,
                              colorText: AppConstants.appTextColor,
                              borderColor: AppConstants.appMainColor,
                            );
                            Get.offAll(() => const MainScreen());

                           }else{
                             Get.snackbar(
                              AppStrings.error,
                              AppStrings.pleaseVerify,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstants.appSecondaryColor,
                              colorText: AppConstants.appTextColor,
                              borderColor: AppConstants.appMainColor,
                            );
                           }
                         }else{
                            Get.snackbar(
                              AppStrings.error,
                              AppStrings.pleaseTryAgain,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstants.appSecondaryColor,
                              colorText: AppConstants.appTextColor,
                              borderColor: AppConstants.appMainColor,
                            );
                         }
                      }
                    },
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
