import 'package:get/get.dart';
import 'package:guzogo_cloned/bindings/splash_screen_binding.dart';
import 'package:guzogo_cloned/screens/splash_screen.dart';

class AppRoutes {
  static const splashScreen = '/';
  static List<GetPage> pages = [
    GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
        binding: SplashScreenBinding()),
  ];
}
