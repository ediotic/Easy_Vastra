import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/strings/app_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        backgroundColor: AppConstants.appBgColor,
        appBar: AppBar(
          backgroundColor: AppConstants.appMainColor,
          title: const Text(
            AppStrings.welcome,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600 ,color: AppConstants.appTextColor),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                color: AppConstants.appMainColor,
                child: Lottie.asset(AppConstants.splashLogo),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Text(
                  AppStrings.happyShopping,
                  style: TextStyle(fontSize:18, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: Get.height / 12,
              ),
              Material(
                child: Container(
                  width: Get.width / 1.3,
                  height: Get.height / 16,
                  decoration: BoxDecoration(
                    color: AppConstants.appSecondaryColor,
                    borderRadius: BorderRadius.circular(20.5),
                  ),
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: Image.asset(AppConstants.googleLogo),
                      label: const Text(
                        AppStrings.signInWithGoogle,
                        style: TextStyle(color: AppConstants.appTextColor),
                      )),
                ),
              ),
              SizedBox(
                height: Get.height / 30,
              ),
              Material(
                child: Container(
                  width: Get.width / 1.3,
                  height: Get.height / 16,
                  decoration: BoxDecoration(
                    color: AppConstants.appSecondaryColor,
                    borderRadius: BorderRadius.circular(20.5),
                  ),
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.email_sharp,
                        color: AppConstants.appTextColor,
                        size: 25,
                      ),
                      label: const Text(
                        AppStrings.signInWithEmail,
                        style: TextStyle(color: AppConstants.appTextColor),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
