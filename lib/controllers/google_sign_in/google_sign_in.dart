import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_vastra/utils/strings/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../modals/user_models/user_models.dart';
import '../../screens/user_panel/main_screen.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        EasyLoading.show( status: AppStrings.pleaseWait);
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          UserModels userModels = UserModels(
              uId: user.uid,
              userName: user.displayName.toString(),
              email: user.email.toString(),
              phone: user.phoneNumber.toString(),
              userImg: user.photoURL.toString(),
              userDeviceToken: '',
              country: '',
              userAddress: '',
              street: '',
              isAdmin: false,
              isActive: true,
              createdOn: DateTime.now());
        await FirebaseFirestore.instance          /// where to store the details
              .collection("users")
              .doc(user.uid)
              .set(userModels.toMap());
              EasyLoading.dismiss();

              Get.offAll(() =>const MainScreen());

          
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("error $e");
    }
  }
}
