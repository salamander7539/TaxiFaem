import 'package:flutter_faem_app/Models/Options.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

var names;

List<Service> serviceObj;

Future<List<Service>> getServices() async {
  var url = "https://client.apis.stage.faem.pro/api/v2/options";
  final response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  if (response.statusCode == 200) {
    var serviceResponse = json.decode(response.body)['services'] as List;
    serviceObj =
    serviceResponse.map((serviceJson) => Service.fromJson(serviceJson)).toList();
  } else {
    print('Services Error: ${response.body}');
  }
  return(serviceObj);
}


