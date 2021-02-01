import 'dart:async';

import 'package:flutter_faem_app/Screens/main_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


final String faemLogo = 'assets/svg_images/FaemLogo.svg';
final Widget svg = SvgPicture.asset(faemLogo,
    semanticsLabel: 'Faem Logo',
    color: Colors.red,
);


class StartScreen extends StatefulWidget {

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: svg,
        ),
      ),
    );
  }
}
