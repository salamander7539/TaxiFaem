import 'package:flutter_faem_app/Models/CurrentLocation.dart';
import 'package:geolocator/geolocator.dart';

// ignore: missing_return
Future<CurrentLocationData> getCurrentLocation() async {
  CurrentLocationData currentLocationData;
  try {
    currentLocationData.position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    return currentLocationData;
  } catch (err) {
    print(err.message);
  }
}

