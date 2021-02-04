import 'package:flutter_faem_app/tokenData/refresh_token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<void> ratingOrder(String driverUuid, String orderUuid, var ratingValue) async {
  var jsonBody = json.encode({
    "driver_uuid": driverUuid,
    "order_uuid": orderUuid,
    "value": ratingValue
    // "comment":
  });
  var url = "https://client.apis.stage.faem.pro/api/v2/order/rating";
  var response = await http.post(url, body: jsonBody, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $newToken'
  });
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
  } else {
    print("Error post rating with code ${response.statusCode}");
    print("${response.body}");
  }
}