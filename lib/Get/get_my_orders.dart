import 'package:flutter_faem_app/Models/MyOrdersList.dart';
import 'package:flutter_faem_app/tokenData/refresh_token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

var names;

List<MyOrders> myOrders;

Future<List<MyOrders>> getMyOrders() async {
  var url = "https://client.apis.stage.faem.pro/api/v2/myorders";
  final response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $newToken'
  });
  if (response.statusCode == 200) {
    var myOrdersResponse = json.decode(response.body) as List;
    myOrders = myOrdersResponse.map((myOrdersJson) => MyOrders.fromJson(myOrdersJson)).toList();
    print(response.body);
  } else {
    print('Services Error: ${response.body}');
  }
  return(myOrders);
}


