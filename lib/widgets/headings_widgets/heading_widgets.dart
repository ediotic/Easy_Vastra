// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables



import 'package:easy_vastra/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/strings/app_strings.dart';

class HeadingWidgets extends StatelessWidget {
   final String headingTitle;
   final String headingSubTitle;
   final String buttonText;
   final VoidCallback onTap;
  const HeadingWidgets({
    super.key,
    required this.headingSubTitle,
    required this.headingTitle,
    required this.onTap,
    required this.buttonText,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( horizontal: 5.0 , vertical: 10.0),
      child: Padding(padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                     Text(headingTitle ,
                     style: TextStyle(fontWeight: FontWeight.w900 , color: AppColors.hdc),
                     ),
                     Text(headingSubTitle,
                     style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 12, color: AppColors.hdcc),
                     ),
                 
              ],
             ),
                  GestureDetector(
                    onTap: onTap,
                   child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0 ,vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: AppConstants.appSecondaryColor,
                            width: 1.2,
                            ),
                        ),
                        child: Text(buttonText ,  style: TextStyle(fontWeight: FontWeight.w500 ,color: AppConstants.appSecondaryColor, fontSize: 12.0),),
                       ),
                 ),

        ],
      ),
      ),
    );
  }
}