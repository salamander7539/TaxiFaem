import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_faem_app/Post/build_route_way.dart';


Future<int> cancelOrder(String orderUuid) async {
  var jsonRequest = jsonEncode({
    "reason": "order_is_not_relevant",
  });
  var url = 'https://client.apis.stage.faem.pro/api/v2/orders/cancel/$orderUuid';
  var response =
      await http.put(url, body: jsonRequest, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  print(jsonRequest);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  print(response.body);
  return response.statusCode;
}
