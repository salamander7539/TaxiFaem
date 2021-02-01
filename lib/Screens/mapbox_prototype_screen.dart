//import 'package:flutter/material.dart';
//import 'package:mapbox_gl/mapbox_gl.dart';
//import 'package:location/location.dart';
//
//class MapBoxProto extends StatefulWidget {
//  @override
//  _MapBoxProtoState createState() => _MapBoxProtoState();
//}
//
//Location location = new Location();
//
//bool _serviceEnabled;
//PermissionStatus _permissionGranted;
//LocationData _locationData;
//
//class _MapBoxProtoState extends State<MapBoxProto> {
//  MapboxMapController mapController;
//
//  void _onMapCreated(MapboxMapController controller) {
//    mapController = controller;
//  }
//
//  getLocation() async {
//    _serviceEnabled = await location.serviceEnabled();
//    if (!_serviceEnabled) {
//      _serviceEnabled = await location.requestService();
//      if (!_serviceEnabled) {
//        return;
//      }
//    }
//
//    _permissionGranted = await location.hasPermission();
//    if (_permissionGranted == PermissionStatus.denied) {
//      _permissionGranted = await location.requestPermission();
//      if (_permissionGranted != PermissionStatus.granted) {
//        return;
//      }
//    }
//
//    _locationData = await location.getLocation();
//  }
//
//  changeLocation() {}
//
//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder<Object>(
//        future: getLocation(),
//        builder: (context, snapshot) {
//          return Scaffold(
//            body: MapboxMap(
//              accessToken:
//                  'pk.eyJ1IjoiZmFlbXRheGkiLCJhIjoiY2pyYXNqZ3RhMHQxNTQ5bjBxMWlvcWF6eSJ9.ISSgNBMdG7idL3ljb2ILTg',
//              onMapCreated: _onMapCreated,
//              initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
//            ),
//          );
//        });
//  }
//}
