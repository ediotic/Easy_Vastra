// import 'package:easy_vastra/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: AppConstants.appMainColor,
        title: const Text(AppConstants.appMainName , style: TextStyle( color: AppConstants.appTextColor),),
        centerTitle: true,
       ),
    );
  }
}