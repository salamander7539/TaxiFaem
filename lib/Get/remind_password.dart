import 'package:flutter_faem_app/Screens/auth_phone_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

import '../app.dart';



Future<dynamic> remindPassword() async {
  var body = json.encode({
    "device_id": deviceId,
    "phone": phone
  });
  var url = 'https://driver.apis.stage.faem.pro/api/v2/auth/remind/password';
  sharedPreferences = await SharedPreferences.getInstance();
  var response = await http.post(url, body: body, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ${sharedPreferences.get('jwt')}'
  });
  if (response.statusCode == 200) {
    print(response.body);
    /*Вывести сообщение*/
  } else {
    print("Error order with code ${response.statusCode}");
    print(response.body);
  }
  return response.statusCode;
}