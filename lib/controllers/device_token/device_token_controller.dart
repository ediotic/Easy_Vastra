import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/strings/app_strings.dart';

class GetdeviceTokenController  extends GetxController {
  String? deviceToken;

  @override
  void onInit() {
    super.onInit();
    print("token ::: $deviceToken ");
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try{
      String? token = await FirebaseMessaging.instance.getToken();
      if( token != null){
         deviceToken = token;
          update();
      }
    } catch(e){
       Get.snackbar(
        AppStrings.error,
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstants.appSecondaryColor,
        colorText: AppConstants.appTextColor,
        borderColor: AppConstants.appMainColor,
      );
    }
  }
}