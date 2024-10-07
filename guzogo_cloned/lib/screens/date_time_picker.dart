
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guzogo_cloned/controller/home_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// ignore: must_be_immutable
class DateTimePicker extends StatelessWidget {
  DateTimePicker({super.key});
  final homeController = Get.put(HomeController());
  String selectedStartDate = "";
  String selectedEndDate = "";

  void getSelctedDate(String dateStarted, String dateEnded) {
    homeController.startDateSelected.value = dateStarted;
    homeController.endDateSelected.value = dateEnded;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: GestureDetector(
            onTap: () {
            
              Get.back();
            },
            child: const Icon(
              FontAwesomeIcons.angleLeft,
              color: Color.fromRGBO(1, 1, 33, 0.4),
            )),
        title: SizedBox(
          width: size.width * 0.6,
          child: Padding(
            padding: EdgeInsets.only(top: size.height * 0.03, bottom: 10),
            child: Text(
              "Select the deprature and return date",
              maxLines: 2,
              style: GoogleFonts.afacad(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SfDateRangePicker(
              initialDisplayDate: DateTime.now(),
              initialSelectedDate: DateTime.now(),
              controller: DateRangePickerController(),
              view: DateRangePickerView.month,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs d) async{
              selectedStartDate = d.value.startDate.toString();
              selectedEndDate = d.value.endDate.toString();
              },
              endRangeSelectionColor: const Color.fromARGB(255, 250, 213, 28),
              startRangeSelectionColor: const Color.fromARGB(255, 250, 213, 28),
              rangeSelectionColor: const Color.fromRGBO(250, 213, 28, 0.1),
              selectionColor: const Color.fromARGB(255, 250, 213, 28),
              backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
              selectionShape: DateRangePickerSelectionShape.circle,
              selectionMode: DateRangePickerSelectionMode.range,
              enableMultiView: true,
              navigationDirection: DateRangePickerNavigationDirection.vertical,
              headerStyle: const DateRangePickerHeaderStyle(
                backgroundColor: Colors.transparent,
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(1, 1, 33, 0.4),
                ),
              ),
              monthViewSettings: const DateRangePickerMonthViewSettings(
                showTrailingAndLeadingDates: true,
              ),
              monthCellStyle: const DateRangePickerMonthCellStyle(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                todayTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
              yearCellStyle: const DateRangePickerYearCellStyle(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  todayCellDecoration: BoxDecoration()),
                  onSubmit:(v)=> getSelctedDate,
            ),
          ),
          Positioned(
              bottom: 0,
              child: SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async{
                          getSelctedDate(selectedStartDate,selectedEndDate);
                          
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 250, 213, 28),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.3)),
                        child: Text(
                          "Continue",
                          style: GoogleFonts.afacad(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 1, 1, 65)),
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
