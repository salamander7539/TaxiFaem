// To parse this JSON data, do
//
//     final findAddressData = findAddressDataFromJson(jsonString);

class AddressData {
  AddressData({
    this.unrestrictedValue,
    this.value,
    this.country,
    this.region,
    this.regionType,
    this.city,
    this.cityType,
    this.street,
    this.streetType,
    this.streetWithType,
    this.house,
    this.outOfTown,
    this.houseType,
    this.accuracyLevel,
    this.radius,
    this.lat,
    this.lon,
  });

  final String unrestrictedValue;
  final String value;
  final String country;
  final String region;
  final String regionType;
  final String city;
  final String cityType;
  final String street;
  final String streetType;
  final String streetWithType;
  final String house;
  final bool outOfTown;
  final String houseType;
  final int accuracyLevel;
  final int radius;
  final double lat;
  final double lon;

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
    unrestrictedValue: json["unrestricted_value"] == null ? null : json["unrestricted_value"],
    value: json["value"] == null ? null : json["value"],
    country: json["country"] == null ? null : json["country"],
    region: json["region"] == null ? null : json["region"],
    regionType: json["region_type"] == null ? null : json["region_type"],
    city: json["city"] == null ? null : json["city"],
    cityType: json["city_type"] == null ? null : json["city_type"],
    street: json["street"] == null ? null : json["street"],
    streetType: json["street_type"] == null ? null : json["street_type"],
    streetWithType: json["street_with_type"] == null ? null : json["street_with_type"],
    house: json["house"] == null ? null : json["house"],
    outOfTown: json["out_of_town"] == null ? null : json["out_of_town"],
    houseType: json["house_type"] == null ? null : json["house_type"],
    accuracyLevel: json["accuracy_level"] == null ? null : json["accuracy_level"],
    radius: json["radius"] == null ? null : json["radius"],
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lon: json["lon"] == null ? null : json["lon"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "unrestricted_value": unrestrictedValue == null ? null : unrestrictedValue,
    "value": value == null ? null : value,
    "country": country == null ? null : country,
    "region": region == null ? null : region,
    "region_type": regionType == null ? null : regionType,
    "city": city == null ? null : city,
    "city_type": cityType == null ? null : cityType,
    "street": street == null ? null : street,
    "street_type": streetType == null ? null : streetType,
    "street_with_type": streetWithType == null ? null : streetWithType,
    "house": house == null ? null : house,
    "out_of_town": outOfTown == null ? null : outOfTown,
    "house_type": houseType == null ? null : houseType,
    "accuracy_level": accuracyLevel == null ? null : accuracyLevel,
    "radius": radius == null ? null : radius,
    "lat": lat == null ? null : lat,
    "lon": lon == null ? null : lon,
  };
}
