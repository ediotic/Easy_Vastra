// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../../modals/category/category_models.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/strings/app_strings.dart';
import 'single_categories_products_screen.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appMainColor,
        iconTheme: IconThemeData(color: AppConstants.appTextColor),
        title: Text(
          AppStrings.allCategories,
          style: TextStyle(color: AppConstants.appTextColor),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("categories").get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: Get.height / 5,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No category found!"),
            );
          }
          if (snapshot.data != null) {
            return GridView.builder(
               shrinkWrap: true,
               physics: BouncingScrollPhysics(),
               itemCount: snapshot.data!.docs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.2),
              itemBuilder: (context, Index) {
                CategoriesModel categoriesModel = CategoriesModel(
                    categoryId: snapshot.data!.docs[Index]['categoryId'],
                    categoryImg: snapshot.data!.docs[Index]['categoryImg'],
                    categoryName: snapshot.data!.docs[Index]['categoryName'],
                    createdAt: snapshot.data!.docs[Index]['createdAt'],
                    updatedAt: snapshot.data!.docs[Index]['updatedAt']);
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => AllSingleCategoryScreen( categoryId: categoriesModel.categoryId)),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          child: FillImageCard(
                            borderRadius: 20.0,
                            width: Get.width / 2.3,
                            heightImage: Get.height / 10,
                            imageProvider: CachedNetworkImageProvider(
                                categoriesModel.categoryImg),
                            title: Center(
                              child: Text(
                                categoriesModel.categoryName,
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
            // Container(
            //   height: Get.height / 5,
            //   child: ListView.builder(
            //      
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,

            //       ),
            // );
          }
          return Container();
        },
      ),
    );
  }
}
