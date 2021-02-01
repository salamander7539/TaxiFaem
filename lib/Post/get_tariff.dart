import 'package:flutter_faem_app/Get/init_data.dart';
import 'package:flutter_faem_app/Models/GetTariffData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'build_route_way.dart';

GetTariff getTariffData;

Future<GetTariff> getTariff(serviceUuid, List<String> featureUuid) async {
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
    "service_uuid": serviceUuid == null ? "b65d4d24-6df0-4630-a87e-e296447b04c5" : serviceUuid,
    "features_uuids": featureUuid
  });
  var url = 'https://crm.apis.stage.faem.pro/api/v2/orders/tariff';
  var response = await http.post(
      url, body: jsonRequest, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    getTariffData = new GetTariff.fromJson(jsonResponse);
    var price = getTariffData.totalPrice;
  } else {
    // print("Error code getTariff: ${response.statusCode}");
    // print("Error getTariff: ${response.body}");
  }
  print(response.body);
  return getTariffData;
}