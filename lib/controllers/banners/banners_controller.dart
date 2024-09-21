import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannersController extends GetxController{
  RxList<String> bannerUrls = RxList<String>([]);

  @override
  void onInit() {
    super.onInit();
    fetchBannersUrls();
  }
  /// fetch banners
   Future<void> fetchBannersUrls() async {
     try{
      QuerySnapshot bannersSnapShot= await FirebaseFirestore.instance.collection('banners').get();
      if(bannersSnapShot.docs.isNotEmpty){
        bannerUrls.value=bannersSnapShot.docs.map((doc) => doc['imageUrl']as String).toList();
      }
     } catch(e){
      print("error ::: $e");
     }
   }
}