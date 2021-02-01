import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.grey, // Color for Android
      statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
  ));

  runApp(MyApp());
}

