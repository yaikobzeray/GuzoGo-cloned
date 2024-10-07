import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guzogo_cloned/controller/home_controller.dart';
import 'package:guzogo_cloned/screens/date_time_picker.dart';
import 'package:intl/intl.dart';

class HomeScreenTable extends StatelessWidget {
   HomeScreenTable({super.key});
  final controller = Get.put(HomeController());
 void _showCabinClassModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      shape: const BeveledRectangleBorder(),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 225,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cabin Class',
                    style: GoogleFonts.afacad(
                        fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.afacad(
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                            color: Colors.black),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.selectedCabin.value =
                              controller.cabinClass[index]['text']!;
                              Navigator.pop(context);
                        },
                        child: Obx(
                          () => Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.cabinClass[index]['text']!,
                                    style: GoogleFonts.afacad(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.black),
                                  ),
                                  if (controller.cabinClass[index]['text'] ==
                                      controller.selectedCabin.value)
                                    const Icon(
                                      FontAwesomeIcons.check,
                                      size: 16,
                                    )
                                ],
                              ),
                              const Gap(3),
                              const Divider(),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }

  void _showPassangerModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      shape: const BeveledRectangleBorder(),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cabin Class',
                    style: GoogleFonts.afacad(
                        fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.afacad(
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                                color: Colors.black),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Done",
                            style: GoogleFonts.afacad(
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                                color: Colors.black),
                          )),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Adult",
                    style: GoogleFonts.afacad(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            if (controller.adults.value > 1) {
                              controller.adults.value--;
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              size: 14,
                            ),
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.adults.value.toString(),
                            style: GoogleFonts.afacad(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.adults.value++;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            // ignore: deprecated_member_use
                            child: const Icon(FontAwesomeIcons.add, size: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                      text: "Childeren",
                      style: GoogleFonts.afacad(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "2-12 Years",
                          style: GoogleFonts.afacad(
                              fontSize: 16,
                              fontWeight: FontWeight.w100,
                              color: Colors.grey.withOpacity(0.8)),
                        )
                      ])),
                  SizedBox(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            if (controller.childrens.value > 0) {
                              controller.childrens.value--;
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              size: 14,
                            ),
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.childrens.value.toString(),
                            style: GoogleFonts.afacad(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.childrens.value++;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            // ignore: deprecated_member_use
                            child: const Icon(FontAwesomeIcons.add, size: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                      text: "Infat",
                      style: GoogleFonts.afacad(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "<2 Years",
                          style: GoogleFonts.afacad(
                              fontSize: 16,
                              fontWeight: FontWeight.w100,
                              color: Colors.grey.withOpacity(0.8)),
                        )
                      ])),
                  SizedBox(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            if (controller.infats.value > 0) {
                              controller.infats.value--;
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              size: 14,
                            ),
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.infats.value.toString(),
                            style: GoogleFonts.afacad(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.infats.value++;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            // ignore: deprecated_member_use
                            child: const Icon(FontAwesomeIcons.add, size: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Table(
              border: TableBorder.all(
                  color: Colors.grey.withOpacity(0.3), width: 1),
              children: [
                TableRow(
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => DateTimePicker());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Departure Date",
                                style: GoogleFonts.afacad(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100,
                                    color: const Color.fromRGBO(1, 1, 33, 0.4),
                                    letterSpacing: 1),
                              ),
                              Row(
                                children: [
                                  Text(
                                    DateFormat('dd').format(DateTime.parse(
                                        controller.startDateSelected.value)),
                                    style: GoogleFonts.afacad(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w100,
                                        color:
                                            const Color.fromRGBO(1, 1, 33, 1),
                                        letterSpacing: 1),
                                  ),
                                  Gap(size.width * 0.04),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat('MMM').format(DateTime.parse(
                                            controller
                                                .startDateSelected.value)),
                                        style: GoogleFonts.afacad(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        DateFormat('EEEE').format(
                                            DateTime.parse(controller
                                                .startDateSelected.value)),
                                        style: GoogleFonts.afacad(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: controller.homeTabBarIndex.value == 0
                            ? InkWell(
                                onTap: () async {
                                  Get.to(() => DateTimePicker());
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Return Date",
                                      style: GoogleFonts.afacad(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w100,
                                          color: const Color.fromRGBO(
                                              1, 1, 33, 0.4),
                                          letterSpacing: 1),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          DateFormat('dd').format(
                                              DateTime.parse(controller
                                                  .endDateSelected.value)),
                                          style: GoogleFonts.afacad(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w100,
                                              color: const Color.fromRGBO(
                                                  1, 1, 33, 1),
                                              letterSpacing: 1),
                                        ),
                                        Gap(size.width * 0.04),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              DateFormat('MMM').format(
                                                  DateTime.parse(controller
                                                      .endDateSelected.value)),
                                              style: GoogleFonts.afacad(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              DateFormat('EEEE').format(
                                                  DateTime.parse(controller
                                                      .endDateSelected.value)),
                                              style: GoogleFonts.afacad(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InkWell(
                        onTap: () {
                          _showCabinClassModal(context);
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cabin Class",
                                style: GoogleFonts.afacad(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100,
                                    color: const Color.fromRGBO(1, 1, 33, 0.4),
                                    letterSpacing: 1),
                              ),
                              Obx(
                                () => Text(
                                  controller.selectedCabin.value,
                                  style: GoogleFonts.afacad(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InkWell(
                        onTap: () {
                          _showPassangerModal(context);
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Passengers",
                                style: GoogleFonts.afacad(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100,
                                    color: const Color.fromRGBO(1, 1, 33, 0.4),
                                    letterSpacing: 1),
                              ),
                              Gap(size.height * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.person,
                                        size: size.height * 0.025,
                                      ),
                                      Obx(() => Text(
                                          controller.adults.value.toString()))
                                    ],
                                  ),
                                  Gap(size.width * 0.04),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.person,
                                        size: size.height * 0.02,
                                      ),
                                      Obx(() => Text(controller.childrens.value
                                          .toString()))
                                    ],
                                  ),
                                  Gap(size.width * 0.04),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.child,
                                        size: size.height * 0.015,
                                      ),
                                      Obx(
                                        () => Text(
                                          controller.infats.value.toString(),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            );
  }
}