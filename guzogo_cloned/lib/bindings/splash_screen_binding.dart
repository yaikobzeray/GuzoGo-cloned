import 'package:get/get.dart';
import 'package:guzogo_cloned/controller/splash_controller.dart';

class SplashScreenBinding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut(()=>SplashScreenController());
  }

}