// // ignore_for_file: prefer_const_constructors

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../controllers/banners/banners_controller.dart';

// class BannerWidget extends StatefulWidget {
//   const BannerWidget({super.key});

//   @override
//   State<BannerWidget> createState() => _BannerWidgetState();
// }

// class _BannerWidgetState extends State<BannerWidget> {
//   final CarouselController carouselController = CarouselController();
//   final BannersController _bannersController = Get.put(BannersController());
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Obx(() {
//         return CarouselSlider(
//             items: _bannersController.bannerUrls
//                 .map(
//                   (imageUrls) => ClipRRect(
//                     borderRadius: BorderRadius.circular(10.0),
//                     child: CachedNetworkImage(
//                       imageUrl: imageUrls,
//                       fit: BoxFit.cover,
//                       width: Get.width - 10,
//                       placeholder: (context, url) => ColoredBox(
//                         color: Color(0xFFFFFFFF),
//                         child: Center(
//                           child: CupertinoActivityIndicator(),
//                         ),
//                       ),
//                       errorWidget: (context, url, error) => Icon(Icons.error),
//                     ),
//                   ),
//                 )
//                 .toList(),
//             options: CarouselOptions(
//               scrollDirection: Axis.horizontal,
//               autoPlay: true,
//               aspectRatio: 2.5,
//               viewportFraction: 1
//             ),
//             );
//       }),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/banners/banners_controller.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final CarouselController carouselController = CarouselController();
  final BannersController _bannersController = Get.put(BannersController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (_bannersController.bannerUrls.isEmpty) {
          return Center(child: Text("No banners available"));
        }
        return CarouselSlider(
          items: _bannersController.bannerUrls.map((imageUrls) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: imageUrls,
                fit: BoxFit.cover,
                width: Get.width - 10,
                placeholder: (context, url) => ColoredBox(
                  color: Color(0xFFFFFFFF),
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) {
                  print('Error loading image: $error');
                  return Icon(Icons.error);
                },
              ),
            );
          }).toList(),
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            aspectRatio: 2.5,
            viewportFraction: 1,
          ),
        );
      }),
    );
  }
}

