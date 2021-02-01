import 'package:geolocator/geolocator.dart';

class CurrentLocationData{
  Position position;
  var lat;
  var lng;


  CurrentLocationData({
    this.position,
    this.lat,
    this.lng,
  });
}