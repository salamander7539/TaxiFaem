import 'dart:async';
import 'package:location/location.dart';

class LocationService {
  UserLocation currentLocation;

  Location location = Location();

  StreamController<UserLocation> _locationController = StreamController<UserLocation>.broadcast();

  LocationService() {
    location.requestPermission().then((granted) {
      if (granted != null) {
        location.onLocationChanged.listen((locationData){
          if (locationData != null) {
            _locationController.add(UserLocation(latitude: locationData.latitude, longitude: locationData.longitude));
          }
        });
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
      print('lat ${userLocation.latitude}, lng ${userLocation.longitude}');
    } catch (e) {
      print("Can't find location $e");
    }
    return currentLocation;
  }
}

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({this.latitude, this.longitude});
}
