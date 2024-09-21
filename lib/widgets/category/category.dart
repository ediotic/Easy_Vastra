// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_types_as_parameter_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_vastra/screens/user_panel/single_categories_products_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../../modals/category/category_models.dart';

class CategoryWidgets extends StatelessWidget {
  const CategoryWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
          return Container(
            height: Get.height / 5,
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
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
                        onTap: () => Get.to(() => AllSingleCategoryScreen(categoryId: categoriesModel.categoryId)),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            child: FillImageCard(
                              borderRadius: 20.0,
                              width: Get.width / 4.0,
                              heightImage: Get.height / 12,
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
                }),
          );
        }
        return Container();
      },
    );
  }
}
