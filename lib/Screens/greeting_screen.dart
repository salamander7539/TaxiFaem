import 'package:flutter_faem_app/Screens/main_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

final String startPic = 'assets/svg_images/Start.svg';
final Widget svgGreet = SvgPicture.asset(
  startPic,
  color: null,
  semanticsLabel: 'Faem Start',
);

final String whiteLogoPic = 'assets/svg_images/whiteFaemLogo.svg';
final Widget svgWhiteLogo = SvgPicture.asset(
  whiteLogoPic,
  color: Colors.black,
  semanticsLabel: 'white Faem Start',
);

Position position;
var lat, lng;


class GreetingScreen extends StatefulWidget {
  @override
  _GreetingScreenState createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {

  void getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      lat = position.latitude;
      lng = position.longitude;
    });
    print('Current location lat long ' + position.latitude.toString() + " - " + position.longitude.toString());
    final coordinates = new Coordinates(
        position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    var first = addresses.first;
    print('${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFFC5B58),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(child: svgGreet),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              color: Color(0xFFB8E0E3),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.18,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color(0xFFFC5B58),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0, bottom: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .45,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(28.0)),
                      color: Colors.white,
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MapScreen()));
                      },
                      child: Text(
                        'Приступить',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
