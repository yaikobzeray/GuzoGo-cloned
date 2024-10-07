import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guzogo_cloned/controller/home_controller.dart';
import 'package:guzogo_cloned/widgets/home_screen_header_widget.dart';
import 'package:guzogo_cloned/widgets/home_screen_tab_bar.dart';

import '../data/constants/image_constants.dart';
import '../screens/airport_selection.dart';

class HomeAirportSelection extends StatelessWidget {
   HomeAirportSelection({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SizedBox(
              height: size.height * 0.4,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    ImageConstants.plane,
                    fit: BoxFit.cover,
                    height: size.height * 0.4,
                  ),
                  Container(color: const Color.fromRGBO(1, 1, 33, 0.85)),
                  Column(
                    children: [
                      Gap(size.height * 0.03),
                     const HomeScreenHeaderWidget(),
                      Gap(size.height * 0.04),
                      HomeScreenTabBar(),
                      Gap(size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              splashColor: const Color.fromRGBO(1, 1, 33, 0.85),
                              onTap: () async {
                                var result = await Get.to(
                                  () => AirportSelection(),
                                );
                                if (result != null) {
                                  controller.from.value = result;
                                }
                              },
                              child: Obx(
                                () => Column(
                                  children: [
                                    const Text(
                                      "Form",
                                      style: TextStyle(
                                        color: Color.fromRGBO(240, 240, 240, 1),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Gap(size.height * 0.01),
                                    if (controller.from.value.id.isNotEmpty)
                                      Text(
                                        controller.from.value.iataCode,
                                        style: const TextStyle(
                                            color: Color.fromRGBO(
                                                240, 240, 240, 1),
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    if (controller.from.value.id.isNotEmpty)
                                      Text(
                                        controller.from.value.timezone
                                            .split('/')
                                            .last,
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(240, 240, 240, 1),
                                          fontSize: 14,
                                        ),
                                      ),
                                    Gap(size.height * 0.005),
                                    if (controller.from.value.id.isNotEmpty)
                                      SizedBox(
                                        width: size.width * 0.35,
                                        child: Text(
                                          controller.from.value.airportName,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Color.fromRGBO(
                                                240, 240, 240, 1),
                                            fontSize: 8,
                                          ),
                                        ),
                                      ),
                                    if (controller.from.value.id.isEmpty)
                                      const Text(
                                        "Select Destination",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(240, 240, 240, 1),
                                          fontSize: 14,
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  controller.airportToggle();
                                },
                                icon: CircleAvatar(
                                    backgroundColor:
                                        const Color.fromRGBO(240, 240, 240, 1),
                                    maxRadius: size.width * 0.03,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.plane,
                                          size: size.width * 0.02,
                                        ),
                                        Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.identity()
                                            ..scale(
                                                -1.0, 1.0), // Flip horizontally
                                          child: Icon(
                                            FontAwesomeIcons.plane,
                                            size: size.width * 0.02,
                                          ),
                                        ),
                                      ],
                                    ))),
                            InkWell(
                              onTap: () async {
                                controller.to.value =
                                    await Get.to(() => AirportSelection());
                              },
                              child: Obx(
                                () => Column(
                                  children: [
                                    const Text(
                                      "To",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(240, 240, 240, 1),
                                          fontSize: 12),
                                    ),
                                    Gap(size.height * 0.01),
                                    if (controller.to.value.id.isNotEmpty)
                                      Text(
                                        (controller.to.value).iataCode,
                                        style: const TextStyle(
                                            color: Color.fromRGBO(
                                                240, 240, 240, 1),
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    if (controller.to.value.id.isNotEmpty)
                                      Text(
                                        (controller.to.value)
                                            .timezone
                                            .split('/')
                                            .last,
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(240, 240, 240, 1),
                                          fontSize: 14,
                                        ),
                                      ),
                                    Gap(size.height * 0.005),
                                    if (controller.to.value.id.isNotEmpty)
                                      SizedBox(
                                        width: size.width * 0.35,
                                        child: Text(
                                          (controller.to.value).airportName,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Color.fromRGBO(
                                                240, 240, 240, 1),
                                            fontSize: 8,
                                          ),
                                        ),
                                      ),
                                    if (controller.to.value.id.isEmpty)
                                      const Text(
                                        "Select Destination",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(240, 240, 240, 1),
                                          fontSize: 14,
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
  }
}