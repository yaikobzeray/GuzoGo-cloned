
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:guzogo_cloned/bindings/splash_screen_binding.dart';
import 'package:guzogo_cloned/routes/app_routes.dart';

import 'screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor:
        Color.fromRGBO(2, 0, 83, 0.92), // You can use any color here
    statusBarIconBrightness:
        Brightness.light, // For light-colored status bar icons
  ));
  runApp(const MyApp());
}

 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: SplashScreenBinding(),
      home: Builder(
        builder: (context) {
          return const SplashScreen();
        })
        ,
       getPages: AppRoutes.pages,
    );
  }
}

