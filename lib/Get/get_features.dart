import 'package:flutter_faem_app/Models/Options.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

var names;

List<Feature> featuresObj;

Future<List<Feature>> getFeatures() async {
  var url = "https://client.apis.stage.faem.pro/api/v2/options";
  final response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  if (response.statusCode == 200) {
    var featuresResponse = json.decode(response.body)['features'] as List;
    featuresObj =
    featuresResponse.map((featureJson) => Feature.fromJson(featureJson)).toList();
  } else {
    print('Features Error: ${response.body}');
  }
  return(featuresObj);
}