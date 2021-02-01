import 'package:flutter_faem_app/Models/BuildRouteModel.dart';
import 'package:flutter_faem_app/Models/FindAddressModel.dart';
import 'package:flutter_faem_app/Post/build_route_way.dart';
import 'package:flutter_faem_app/Post/find_address.dart';
import 'package:flutter_faem_app/Post/find_special_address.dart';
import 'package:flutter_faem_app/Screens/make_order_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_faem_app/Location/user_location.dart';
import '../app.dart';
import 'package:provider/provider.dart';
import 'Drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'create_order_screen.dart';
import 'package:geocoder/geocoder.dart';
import 'package:move_to_background/move_to_background.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}


PersistentBottomSheetController bottomSheetController;
List<BuildRouteWay> coords;
final GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey<ScaffoldState>();

class _MapScreenState extends State<MapScreen> {
  MapController mapController;
  LatLng centerPos;
  var newAddress;
  bool moveOver;
  bool visible;
  List routeLatCoordinates = [];
  List routeLngCoordinates = [];
  var polylineCoordinates = <LatLng>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mapController = MapController();
    centerPos = new LatLng(position.latitude, position.longitude);
    // new Timer.periodic(Duration(seconds: 1), (timer) async {
    //   await loadRoute();
    // });
    newAddress = first;
    moveOver = true;
    visible = true;
  }

  changeLocation(newPosLat, newPosLng) {
    var lat = double.parse(newPosLat.toString());
    var lng = double.parse(newPosLng.toString());
    // final coordinates = new Coordinates(lat, lng);
    // var addresses =
    //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // newAddress = addresses.first;
    // print('${newAddress.thoroughfare}, ${newAddress.subThoroughfare}');
  }

  _openMakeOrder() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.45,
        child: MakeOrder(),
      ),
    );
  }

  _openCreateOrder(BuildContext context) {
    showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.7,
        child: CreateOrder(),
      ),
    );
  }


  var addValue;

  @override
  Widget build(BuildContext context) {
    final String faemPoint = 'assets/svg_images/faemPoint.svg';
    final Widget faemSvg = SvgPicture.asset(
      faemPoint,
      semanticsLabel: 'Faem Point',
      color: Color(0xFFFD6F6D),
    );
    final String clientPoint = 'assets/svg_images/clientPoint.svg';
    final Widget clientSvg = SvgPicture.asset(
      clientPoint,
      semanticsLabel: 'Client Point',
    );
    final String locationArrow = 'assets/svg_images/location_arrow.svg';
    final Widget locationArrowSvg = SvgPicture.asset(
      locationArrow,
      semanticsLabel: 'Client Point',
    );

    _changePosition(newPos) {
      setState(() {
        centerPos = newPos.center;
      });
      changeLocation(newPos.center.latitude, newPos.center.longitude);
      FutureBuilder<AddressData>(
        future: findAddress(
          double.parse(newPos.center.latitude.toString()),
          double.parse(newPos.center.longitude.toString()),
        ),
        // ignore: missing_return
        builder: (context, AsyncSnapshot<AddressData> snapshot) {},
      );
      visible = false;
      // print(centerPos);
    }

//    var userLocation = Provider.of<UserLocation>(context);
    return FutureBuilder<UserLocation>(
      future: LocationService().getLocation(),
      // ignore: missing_return
      builder: (context, AsyncSnapshot<UserLocation> locationSnapshot) {
        // print(polylineCoordinates);
        if(locationSnapshot.data.latitude != null) {
          return Scaffold(
            key: mainScaffoldKey,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              // leading: IconButton(
              //   onPressed: () {
              //     Scaffold.of(context).openDrawer();
              //   },
              //   icon: Icon(Icons.menu),
              //   color: Colors.black,
              // ),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              actions: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, -1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(28.0),
                      color: Colors.white,
                    ),
                    child: FlatButton(
                      child: Container(
                        child: Text('Далее'),
                      ),
                      onPressed: () {
                        print('TAP');
                      },
                    ),
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              child: MainDrawer(),
            ),
            body: WillPopScope(
              // ignore: missing_return
              onWillPop: () async {
                MoveToBackground.moveTaskToBack();
                return false;
              },
              child: Stack(
                children: [
                  new FlutterMap(
                    options: new MapOptions(
                      onPositionChanged: (newPosition, check) {
                        _changePosition(newPosition);
                      },
                      controller: mapController,
                      center: new LatLng(locationSnapshot.data.latitude, locationSnapshot.data.longitude),
                      zoom: 17.0,
                      minZoom: 10.0,
                    ),
                    mapController: mapController,
                    layers: [
                      new TileLayerOptions(
                        urlTemplate:
                        "https://api.mapbox.com/styles/v1/faemtaxi/ck0fcruqn1p9o1cnzazi3pli9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZmFlbXRheGkiLCJhIjoiY2pyYXNqZ3RhMHQxNTQ5bjBxMWlvcWF6eSJ9.ISSgNBMdG7idL3ljb2ILTg",
                        additionalOptions: {
                          'accessToken':
                          'pk.eyJ1IjoiZmFlbXRheGkiLCJhIjoiY2pyYXNqZ3RhMHQxNTQ5bjBxMWlvcWF6eSJ9.ISSgNBMdG7idL3ljb2ILTg',
                          'id': 'mapbox.mapbox-traffic-v1'
                        },
                      ),
//                    new PolylineLayerOptions(polylines: [
//                      new Polyline(
//                        points: polylineCoordinates,
//                        // isDotted: true,
//                        color: Color(0xFF669DF6),
//                        strokeWidth: 3.0,
//                      )
//                    ]),
                      new MarkerLayerOptions(
                        markers: [
                          new Marker(
                            width: 25.0,
                            height: 25.0,
                            point: new LatLng(locationSnapshot.data.latitude, locationSnapshot.data.longitude),
                            builder: (context) => new Container(
                              child: clientSvg,
                            ),
                          ),
                          new Marker(
                            width: 120.0,
                            height: 120.0,
                            point: new LatLng(centerPos.latitude, centerPos.longitude),
                            builder: (context) => new Container(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(bottom: 55.0, left: 24.5),
                                child: faemSvg,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 150.0),
                      child: FutureBuilder<AddressData>(
                          future: findAddress(
                            double.parse(centerPos.latitude.toString()),
                            double.parse(centerPos.longitude.toString()),
                          ),
                          // ignore: missing_return
                          builder: (context, AsyncSnapshot<AddressData> snapshot) {
                            if (snapshot.hasData) {
                              findAddressController.text =
                                  snapshot.data.unrestrictedValue;
                              return Text(
                                '${snapshot.data.unrestrictedValue}',
                                // '${newAddress.thoroughfare}, ${newAddress.subThoroughfare}',
                                style: TextStyle(color: Colors.black, fontSize: 20.0),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.0, top: 40.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 90.0, right: 16.0),
                      child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                              mapController.move(
                                  new LatLng(locationSnapshot.data.latitude, locationSnapshot.data.longitude),
                                  mapController.zoom);
                          },
                          shape: CircleBorder(),
                          child: Center(
                            child: locationArrowSvg,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 52.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            // await findAddress(centerPos.latitude, centerPos.longitude);
                            // findAddressController.text = addressValue;
                            await _openCreateOrder(context);
                            startData = await findSpecialAddress(
                                centerPos.latitude, centerPos.longitude);
                            // print(startData);
                            startPointController.text = addressValue;
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Color(0xFF409AFF),
                                ),
                                Text(
                                  'Куда?',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.grey.shade300,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .3,
                height: MediaQuery.of(context).size.height * .25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.0),
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          );
        }
      }
    );
  }
}

