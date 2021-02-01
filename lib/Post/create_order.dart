import 'package:flutter_faem_app/Get/init_data.dart';
import 'package:flutter_faem_app/Models/ServiceModel.dart';
import 'package:flutter_faem_app/Post/build_route_way.dart';
import 'package:flutter_faem_app/Screens/create_order_screen.dart';
import 'package:flutter_faem_app/tokenData/fcm_token.dart';
import 'package:flutter_faem_app/tokenData/refresh_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../app.dart';

var orderUuid;


Future<OrderData> createOrder(String serviceUuid) async {
  OrderData orderData;
  sharedPreferences = await SharedPreferences.getInstance();
  await updateRefreshToken(sharedPreferences.get('refreshToken'));
  await sendFcm(fcmToken);
  var jsonBody = json.encode({
    "callback_phone": clientPhoneNumber,
    "comment": '',
    "routes": [
      startData,
      destData
    ],
    "service_uuid": serviceUuid == null ? "b65d4d24-6df0-4630-a87e-e296447b04c5" : serviceUuid,
    "feature_uuid": '',
  });
  var url = "https://client.apis.stage.faem.pro/api/v2/orders";
  var response = await http.post(url, body: jsonBody, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'source': 'android_client_app_1',
    'Authorization': 'Bearer $newToken'
  });
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    var orderData = new OrderData.fromJson(jsonResponse);
    orderUuid = orderData.uuid;
    print(jsonBody);
  } else {
    print("Error get order with code ${response.statusCode}");
    print("${response.body}");
  }
  return orderData;
}

class OrderData {
  final String uuid;

  OrderData({this.uuid});

  factory OrderData.fromJson(Map<String, dynamic> parsedJson) {
    return OrderData(
      uuid: parsedJson['uuid'] as String,
    );
  }
}
