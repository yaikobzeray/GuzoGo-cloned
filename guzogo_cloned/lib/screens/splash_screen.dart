
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guzogo_cloned/controller/splash_controller.dart';

import '../data/constants/image_constants.dart';

class SplashScreen extends GetWidget<SplashScreenController>{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Image.asset(
            ImageConstants.splash,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Container(color: const Color.fromRGBO(2, 0, 83, 0.92)),
          Positioned(
            top: size.height * 0.4,
            left: size.width * 0.2,
            child: Image.asset(
              ImageConstants.logo,
              fit: BoxFit.cover,
              height: size.height * 0.2,
            ),
          )
        ],
      ),
    ));
  }
}