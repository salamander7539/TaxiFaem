import 'package:flutter_faem_app/Models/BuildRouteModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

var startData, destData;
BuildRouteWay buildRoute;
var routes;

Future<BuildRouteWay> buildRouteWay() async {

  var jsonRequest = jsonEncode(
    [
      startData,
      destData
    ],
  );
  // print(jsonRequest);
  var url = 'https://client.apis.stage.faem.pro/api/v2/buildrouteway';
  var response = await http.post(
      url, body: jsonRequest, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    buildRoute = new BuildRouteWay.fromJson(jsonResponse);
    // var coordinates = json.decode(response.body)['routes']['geometry']['coordinates'].List((data) => BuildRouteWay.fromJson(data))
    //     .toList();
    // print("coordinates $coordinates");
    // routes = buildRoute.routes.geometry.coordinates[1][0];
    // print(routes);
  }
  // print(response.body);
  return buildRoute;
}