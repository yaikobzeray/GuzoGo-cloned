class Airport {
  final String id;
  final String gmt;
  final String airportId;
  final String iataCode;
  final String cityIataCode;
  final String icaoCode;
  final String countryIso2;
  final String geonameId;
  final String latitude;
  final String longitude;
  final String airportName;
  final String countryName;
  final String? phoneNumber; // Nullable field
  final String timezone;

  Airport({
    required this.id,
    required this.gmt,
    required this.airportId,
    required this.iataCode,
    required this.cityIataCode,
    required this.icaoCode,
    required this.countryIso2,
    required this.geonameId,
    required this.latitude,
    required this.longitude,
    required this.airportName,
    required this.countryName,
    this.phoneNumber,
    required this.timezone,
  });

  // Factory method to create an Airport instance from JSON
  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      id: json['id'],
      gmt: json['gmt'],
      airportId: json['airport_id'],
      iataCode: json['iata_code'],
      cityIataCode: json['city_iata_code'],
      icaoCode: json['icao_code'],
      countryIso2: json['country_iso2'],
      geonameId: json['geoname_id'],
      latitude:json['latitude'],
      longitude: json['longitude'],
      airportName: json['airport_name'],
      countryName: json['country_name'],
      phoneNumber: json['phone_number'],
      timezone: json['timezone'],
    );
  }
  @override
    String toString() {
    return 'Airport(id: $id, gmt: $gmt, airportId: $airportId, iataCode: $iataCode, cityIataCode: $cityIataCode, icaoCode: $icaoCode, countryIso2: $countryIso2, geonameId: $geonameId, latitude: $latitude, longitude: $longitude, airportName: $airportName, countryName: $countryName, phoneNumber: $phoneNumber, timezone: $timezone)';
  }


}
