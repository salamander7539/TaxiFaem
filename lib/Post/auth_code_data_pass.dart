import 'dart:convert';
import 'package:flutter_faem_app/Models/AuthCode.dart';
import 'package:flutter_faem_app/Get/init_data.dart';
import 'package:flutter_faem_app/tokenData/refresh_token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import '../app.dart';


var authPassCode, refreshToken;

Future<AuthCodeData> loadAuthCodeData(String device_id, int code) async {
  sharedPreferences = await SharedPreferences.getInstance();
  AuthCodeData authCodeData;
  var json_request = jsonEncode({
    "device_id": device_id,
    "code": code
  });
  var url = 'https://client.apis.stage.faem.pro/api/v2/auth/verification';
  var response = await http.post(url, body: json_request, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  print(json_request);
  if (response.statusCode == 200) {
    print(response.body);
    var jsonResponse = convert.jsonDecode(response.body);
    authCodeData = new AuthCodeData.fromJson(jsonResponse);
    authPassCode = authCodeData.token;
    refreshToken = authCodeData.refresh_token;
    await sharedPreferences.setString('jwt', "$authPassCode");
    await sharedPreferences.setString('refreshToken', '$refreshToken');
    print('ref: ' + refreshToken);
    await updateRefreshToken(refreshToken);
    await getInitData();
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  // print(response.body);
  return authCodeData;
}