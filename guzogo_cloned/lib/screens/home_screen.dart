import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guzogo_cloned/controller/home_controller.dart';
import 'package:guzogo_cloned/widgets/home_screen_table.dart';

import '../widgets/home_airport_selection.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeController());



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            HomeAirportSelection(),
            HomeScreenTable(),
            Gap(size.height * 0.15),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 250, 213, 28),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.2, vertical: 7),
                elevation: 0,
                overlayColor: Colors.transparent,
                shadowColor: Colors.transparent,
                splashFactory: null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                "Search Flights",
                style: GoogleFonts.afacad(
                    color: const Color.fromRGBO(1, 1, 33, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            )
          ],
        )),
      ),
    );
  }
}
