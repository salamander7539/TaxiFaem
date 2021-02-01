import 'dart:convert';
import 'package:flutter_faem_app/Models/Auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

var authCode;

Future<AuthData> loadAuthData(String device_id, String phone) async {
  AuthData authData = null;
  var json_request = jsonEncode({
    "device_id": device_id,
    "phone": phone
  });
  var url = 'https://client.apis.stage.faem.pro/api/v2/auth/new';
  var response = await http.post(url, body: json_request, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  print(json_request);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    authData = new AuthData.fromJson(jsonResponse);
    authCode = authData.code;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  print(response.body);
  return authData;
}