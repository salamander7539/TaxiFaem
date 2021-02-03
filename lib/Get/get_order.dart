import 'package:flutter_faem_app/Models/OrderModel.dart';
import 'package:flutter_faem_app/tokenData/refresh_token.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

var priceData, currencyData;
OrderModel orderModel;

Future<OrderModel> getOrder(String order_uuid) async {
  var url = "https://client.apis.stage.faem.pro/api/v2/orders/$order_uuid" ;
  var response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'source': 'android_client_app_1',
    'Authorization': 'Bearer $newToken'
  });
  if (response.statusCode == 200) {
    print(response.body);
    var jsonResponse = json.decode(response.body);
    var price = new OrderModel.fromJson(jsonResponse);
    priceData = price.tariff.totalPrice;
    currencyData = price.tariff.currency;
    print("Total Price $priceData $currencyData");
  } else {
    print("Error getOrder with code ${response.statusCode}");
    print("${response.body}");
  }
  return orderModel;
}



