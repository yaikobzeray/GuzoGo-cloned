import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guzogo_cloned/controller/home_controller.dart';

class HomeScreenTabBar extends StatelessWidget {
   HomeScreenTabBar({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
                        width: size.width,
                        height: size.height * 0.05,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: const Color.fromRGBO(240, 240, 240, 1))),
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.homeTabBarIndex.value = 0;
                                },
                                child: Container(
                                  width: size.width * 0.4,
                                  height: size.height * 0.035,
                                  decoration: BoxDecoration(
                                      color:
                                          controller.homeTabBarIndex.value == 0
                                              ? const Color.fromRGBO(
                                                  240, 240, 240, 1)
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                    "Return",
                                    style: TextStyle(
                                        color:
                                            controller.homeTabBarIndex.value ==
                                                    0
                                                ? const Color.fromRGBO(
                                                    1, 1, 33, 0.85)
                                                : const Color.fromRGBO(
                                                    240, 240, 240, 1),
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.homeTabBarIndex.value = 1;
                                },
                                child: Container(
                                  width: size.width * 0.4,
                                  height: size.height * 0.035,
                                  decoration: BoxDecoration(
                                      color:
                                          controller.homeTabBarIndex.value == 1
                                              ? const Color.fromRGBO(
                                                  240, 240, 240, 1)
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                    "One-Way",
                                    style: TextStyle(
                                        color:
                                            controller.homeTabBarIndex.value ==
                                                    1
                                                ? const Color.fromRGBO(
                                                    1, 1, 33, 0.85)
                                                : const Color.fromRGBO(
                                                    240, 240, 240, 1),
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
  }
}