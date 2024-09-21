// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../screens/auth_ui/onboading/welcome/welcome_screen.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/strings/app_strings.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: Get.height / 25),
     child: Drawer(
      backgroundColor: AppConstants.appSecondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
           bottomRight: Radius.circular(20.0), 
        )
      ),
      child: Wrap(
        runSpacing: 10,
        children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 20.0),
             child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(AppStrings.ediotic , style: TextStyle( color: AppConstants.appTextColor),),
              subtitle: Text(AppStrings.version , style: TextStyle( color: AppConstants.appTextColor)),
              leading: CircleAvatar(
                radius:  22,
                backgroundColor: AppConstants.appMainColor,
                child: Text(AppStrings.idName , style: TextStyle( color: AppConstants.appTextColor)),
                
              ),
             ),
           ),
           Divider(indent: 10.0, endIndent: 10.0,),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(AppStrings.home , style: TextStyle( color: AppConstants.appTextColor),),
              leading: Icon(CupertinoIcons.home, color: AppConstants.appTextColor),
              trailing: Icon(CupertinoIcons.forward , size:18, color: AppConstants.appTextColor),
             ),
           ),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(AppStrings.products , style: TextStyle( color: AppConstants.appTextColor),),
              leading: Icon(CupertinoIcons.shopping_cart, color: AppConstants.appTextColor),
              trailing: Icon(CupertinoIcons.forward , size:18, color: AppConstants.appTextColor),
             ),
           ),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(AppStrings.orders,style: TextStyle( color: AppConstants.appTextColor),),
              leading: Icon(CupertinoIcons.bag,  color: AppConstants.appTextColor),
              trailing: Icon(CupertinoIcons.forward , size:18, color: AppConstants.appTextColor,),
             ),
           ),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(AppStrings.contact, style: TextStyle( color: AppConstants.appTextColor),),
              leading: Icon(CupertinoIcons.question_circle_fill, color: AppConstants.appTextColor),
              trailing: Icon(CupertinoIcons.forward , size:18, color: AppConstants.appTextColor),
             ),
           ),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: ListTile(
                onTap: () async {
               GoogleSignIn googleSignIn =GoogleSignIn();
               FirebaseAuth _auth = FirebaseAuth.instance;
               
              await googleSignIn.signOut();
              await _auth.signOut();
               Get.offAll(() => WelcomeScreen());
            },
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(AppStrings.logout, style: TextStyle( color: AppConstants.appTextColor),),
              leading: Icon(Icons.logout_rounded ,  color: AppConstants.appTextColor),
              trailing: Icon(CupertinoIcons.forward , size:18,  color: AppConstants.appTextColor),
             ),
           ),
        ],
      ),
     ),
    );
  }
}