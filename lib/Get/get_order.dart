import 'package:flutter_faem_app/Post/create_order.dart';
import 'package:flutter_faem_app/tokenData/refresh_token.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

var priceData, currencyData;

Future<void> getOrder() async {
  var url = "https://client.apis.stage.faem.pro/api/v2/orders/$orderUuid" ;
  var response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'source': 'android_client_app_1',
    'Authorization': 'Bearer $newToken'
  });
  if (response.statusCode == 200) {
    print(response.body);
    var jsonResponse = json.decode(response.body);
    var price = new GetOrderData.fromJson(jsonResponse);
    priceData = price.tariff.total_price;
    currencyData = price.tariff.currency;
    print("Total Price $priceData $currencyData");
  } else {
    print("Error order with code ${response.statusCode}");
    print("${response.body}");
  }
}

class GetOrderData {
  Tariff tariff;

  GetOrderData({this.tariff});

  factory GetOrderData.fromJson(Map<String, dynamic> parsedJson) {
    return GetOrderData(
        tariff: Tariff.fromJson(parsedJson['tariff'])
    );
  }
}

class Tariff {
  final int total_price;
  final String currency;

  Tariff({this.total_price, this.currency});

  factory Tariff.fromJson(Map<String, dynamic> json) {
    return Tariff(
        total_price: json['total_price'],
        currency: json['currency'] as String
    );
  }
}



