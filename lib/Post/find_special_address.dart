import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


Future<dynamic> findSpecialAddress(double lat, double lng) async {
  var jsonResponse;
  var jsonRequest = jsonEncode({
    "lat": double.parse(lat.toStringAsFixed(4)),
    "long": double.parse(lng.toStringAsFixed(4))
  });
  var url = 'https://client.apis.stage.faem.pro/api/v2/findaddress';
  var response = await http.post(url, body: jsonRequest, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  // print(jsonRequest);
  if (response.statusCode == 200) {
    jsonResponse = convert.jsonDecode(response.body);
  } else {
    print('Request FIND ADDRESS failed with status: ${response.statusCode}.');
  }
  return jsonResponse;
}