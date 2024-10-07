import 'package:get/get.dart';

import '../screens/nav_bar.dart';

class SplashScreenController extends GetxController{ 
  
   @override
  void onReady() {
   Future.delayed(const Duration(seconds: 2), () async {
    Get.to(NavBar());
   });
    super.onReady();
  }
}