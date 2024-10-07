import 'package:get/get.dart';
import '../data/models/airport_model.dart';

class HomeController extends GetxController {
  RxInt homeTabBarIndex = 0.obs;
  RxString startDateSelected = "${DateTime.now()}".obs;
  RxString endDateSelected =
      "${DateTime.now().add(const Duration(days: 15))}".obs;

  final cabinClass = [
    {"text": "Economical"},
    {"text": "Bussiness"},
    {"text": "First"},
  ];

  final selectedCabin = "Economical".obs; 

  final adults = 1.obs;
  final childrens = 0.obs;
  final infats = 0.obs;

  final from = Airport(
          id: "1090550",
          gmt: "3",
          airportId: "75",
          iataCode: "ADD",
          cityIataCode: "ADD",
          icaoCode: "HAAB",
          countryIso2: "ET",
          geonameId: "6297257",
          latitude: "8.983759",
          longitude: "38.7959",
          airportName: "Bole International",
          countryName: "Ethiopia",
          phoneNumber: null,
          timezone: "Africa/Addis_Ababa")
      .obs;
  final to = Airport(
          id: "",
          gmt: "",
          airportId: "",
          iataCode: "",
          cityIataCode: "",
          icaoCode: "",
          countryIso2: "",
          geonameId: "",
          latitude: "",
          longitude: "",
          airportName: "",
          countryName: "",
          phoneNumber: null,
          timezone: "")
      .obs;
  void selectedTapItem(int index) {
    homeTabBarIndex.value = index;
  }

  void airportToggle() {
    var temp = from.value;
    from.value = to.value;
    to.value = temp;
  }
}
