import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guzogo_cloned/controller/airport_selection_controller.dart';
import 'package:guzogo_cloned/controller/home_controller.dart';
import 'package:guzogo_cloned/data/models/airport_model.dart';

class AirportSelection extends StatelessWidget {
  AirportSelection({super.key});
  final controller = Get.put(AirportSelectionController());
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(size.height * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text(
                  "Select Airport",
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      Get.back(result: homeController.from.value);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        overlayColor: Colors.white),
                    child: const Text(
                      "Cancle",
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              onChanged: (value) {
                controller.searchText.value = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor:
                      const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.2),
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  prefix: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Icon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.search,
                        size: size.width * 0.05,
                      )),
                  hintText: "Search"),
            ),
          ),
          Divider(
            thickness: size.height * 0.003,
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text("Direct Airports")),
          Expanded(
              child: FutureBuilder(
                  future: controller.getAirLines(),
                  builder: (context, snapshot) => Obx(
                        () => ListView.builder(
                            itemCount: controller.filteredAirports.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  controller.onAirportSelect(
                                      controller.filteredAirports[index]);
                                },
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Transform(
                                          alignment: Alignment
                                              .center, // Set alignment to center
                                          transform: Matrix4.rotationZ(135 *
                                              3.141592653589793238 /
                                              180), // Convert degrees to radians
                                          child: Icon(
                                            FontAwesomeIcons.plane,
                                            size: size.height * 0.022,
                                          )),
                                      title: Text(
                                        '${(controller.filteredAirports[index] as Airport).timezone.split('/').last}, ${(controller.filteredAirports[index] as Airport).airportName} (${(controller.filteredAirports[index] as Airport).iataCode})',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    const Divider()
                                  ],
                                ),
                              );
                            }),
                      )))
        ],
      )),
    );
  }
}
