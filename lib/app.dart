import 'dart:async';

import 'package:flutter_faem_app/Location/user_location.dart';
import 'package:flutter_faem_app/Get/init_data.dart';
import 'package:flutter_faem_app/Screens/main_map_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:geocoder/geocoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/auth_code_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

var milliseconds, lat, lng, first, fcmToken;
Position position;
var globalCheck;
SharedPreferences sharedPreferences;

//Location location = new Location();

bool _serviceEnabled;
//PermissionStatus _permissionGranted;
//LocationData locationData;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAnalytics analytics = FirebaseAnalytics();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  getToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String token = await _firebaseMessaging.getToken();
    fcmToken = token;
    print("FCM-token: $fcmToken");
    sharedPreferences.setString('fcmToken', '$fcmToken');
  }

  void getStartLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    // print('lastPosition $lastPosition');
    setState(() {
      lat = position.latitude;
      lng = position.longitude;
    });
    // await findAddress(double.parse(lat.toStringAsFixed(4)), double.parse(lng.toStringAsFixed(4)));
    // print('Current location lat long ' + position.latitude.toString() + " - " + position.longitude.toString());
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses.first;
    // print('${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
  }

  checkLoginStatus() async {
    await getInitData();
    print(clientUuid);
    if (clientUuid != null) {
      setState(() {
        globalCheck = true;
      });
    } else {
      setState(() {
        globalCheck = false;
      });
    }
    print(globalCheck);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
    globalCheck = false;
    getStartLocation();
//    Timer.periodic(Duration(seconds: 1), (timer) {
//      getStartLocation();
//    });
    checkLoginStatus();
    milliseconds = stopwatch.elapsedMicroseconds;
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFFD6F6D),
          cursorColor: Color(0xFFFD6F6D),
          unselectedWidgetColor: Color(0xFFFD6F6D),
          selectedRowColor: Color(0xFFFD6F6D),
          toggleableActiveColor: Color(0xFFFD6F6D),
        ),
        home: MapScreen(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
  }
}
