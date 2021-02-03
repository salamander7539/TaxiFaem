import 'package:flutter_faem_app/tokenData/refresh_token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


Future<String> getCentrifugeToken() async {
  var url = 'https://notifier.apis.stage.faem.pro/api/v2/connectiontoken';
  var response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Source':'ios_client_app_1',
    'ServiceName': 'faem_taxi',
    'Authorization':'Bearer $newToken'
  });
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse['token'];
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return '';
  }
}