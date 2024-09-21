// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/strings/app_strings.dart';
import '../../widgets/all_products/All_products.dart';
import '../../widgets/banner/banner.dart';
import '../../widgets/category/category.dart';
import '../../widgets/drawer/custom_drawer.dart';
import '../../widgets/flash_sale/flash_sale.dart';
import '../../widgets/headings_widgets/heading_widgets.dart';
import 'all_categories_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstants.appTextColor),
        backgroundColor: AppConstants.appMainColor,
        title: const Text(
          AppConstants.appMainName,
          style: TextStyle(color: AppConstants.appTextColor),
        ),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),

              ///banners
              BannerWidget(),

              ///headings
              HeadingWidgets(
                headingSubTitle: AppStrings.accordingToBudget,
                headingTitle: AppStrings.categories,
                onTap: () =>  Get.to(() => AllCategoriesScreen()),
                buttonText: AppStrings.seeMoreArrow,
              ),

              /// category
              CategoryWidgets(),

              HeadingWidgets(
                headingSubTitle: AppStrings.accordingToBudget,
                headingTitle: AppStrings.flashSale,
                onTap: () =>  Get.to(() => AllCategoriesScreen()),
                buttonText: AppStrings.seeMoreArrow,
              ),

              FlashSaleWidgets(),
              
               HeadingWidgets(
                headingSubTitle: AppStrings.accordingToBudget,
                headingTitle: AppStrings.allProducts,
                onTap: () {},
                buttonText: AppStrings.seeMoreArrow,
              ),
              // AllProductsWidgets(),
               FlashSaleWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
