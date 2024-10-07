import 'package:get/get.dart';
import 'package:guzogo_cloned/controller/home_controller.dart';

import '../data/models/airport_model.dart';
import '../data/services/home_services.dart';

class AirportSelectionController extends GetxController {
  RxList filteredAirports = [].obs;
  RxString searchText = "".obs;
  @override
  void onInit() async {
    await getAirLines();
    filteredAirports.assignAll(airports);
    ever(searchText, (_) {
      filterAirports();
    });
    super.onInit();
  }

  void filterAirports() {
    filteredAirports.value = (airports)
        .where((a) =>
            (a.airportName.toLowerCase().contains(searchText.toLowerCase()) ||
                a.timezone.toLowerCase().contains(searchText.toLowerCase()) ||
                a.iataCode.toLowerCase().contains(searchText.toLowerCase())))
        .toList();
  }

  RxList airports = [].obs;
  final homeService = HomeServices();
  Future<void> getAirLines() async {
    var response = await homeService.getAirPorts();

    try {
      airports.value = List<Airport>.from(response['data'].map((json) {
        // print(json);
        return Airport(
          id: json['id'].toString(),
          gmt: json['gmt'].toString(),
          airportId: json['airport_id'].toString(),
          iataCode: json['iata_code'].toString(),
          cityIataCode: json['city_iata_code'].toString(),
          icaoCode: json['icao_code'].toString(),
          countryIso2: json['country_iso2'].toString(),
          geonameId: json['geoname_id'].toString(),
          latitude: json['latitude'].toString(),
          longitude: json['longitude'].toString(),
          airportName: json['airport_name'].toString(),
          countryName: json['country_name'].toString(),
          timezone: json['timezone'].toString(),
        );
      }));
    // ignore: empty_catches
    } catch (e) {
    }
  }

  final homeController = HomeController();
  void onAirportSelect(Airport airport) {
    Get.back(result: airport);
  }
}
