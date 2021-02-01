import 'package:flutter_faem_app/Get/init_data.dart';
import 'package:flutter_faem_app/Models/GetAllTariffModel.dart';
import 'package:flutter_faem_app/Models/GetTariffData.dart';
import 'package:flutter_faem_app/Screens/make_order_screen.dart';
import 'package:flutter_faem_app/app.dart';
import 'package:flutter_faem_app/tokenData/refresh_token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'build_route_way.dart';

List<GetAllTariff> getAllTariffData;


Future<List<GetAllTariff>> getAllTariff(List<String> featureUuid) async {
    var jsonRequest = jsonEncode({
    // "client": {
    //   "UUID": clientUuid,
    //   "main_phone": clientPhoneNumber
    // },
    // "is_optional": true,
    // "callback_phone": clientPhoneNumber,
    "routes": [
      startData,
      destData
    ],
    // "service_uuid": serviceUuid == null ? "b65d4d24-6df0-4630-a87e-e296447b04c5" : serviceUuid,
    "features_uuids": featureUuid
  });
  var url = 'https://crm.apis.stage.faem.pro/api/v2/orders/tariffs';
  var response = await http.post(
      url, body: jsonRequest, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'source': 'android_client_app_1',
    'Authorization': 'Bearer ${sharedPreferences.getString('jwt')}'
  });
  print(sharedPreferences.getString('jwt'));
  print(jsonRequest);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body) as List;
    getAllTariffData = jsonResponse.map((serviceJson) => GetAllTariff.fromJson(serviceJson)).toList();
    print(jsonResponse);
  } else {
    print("Error code getAllTariff: ${response.statusCode}");
    print("Error getAllTariff: ${response.body}");
  }
  return getAllTariffData;
}