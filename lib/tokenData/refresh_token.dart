import 'package:flutter_faem_app/Models/RefreshModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../app.dart';

String newToken, clientCode, newRefToken;
var updateResponse, updateCode;

RefreshData refreshData;

Future<RefreshData> updateRefreshToken(String refresh) async {
  sharedPreferences = await SharedPreferences.getInstance();
  var jsonBody = json.encode({
    "refresh": refresh,
  });
  const url = "https://client.apis.stage.faem.pro/api/v2/auth/refresh";
  var response = await http.post(url, body: jsonBody, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  print(jsonBody);
  if (response.statusCode == 200) {
    updateResponse = json.decode(response.body);
    refreshData = new RefreshData.fromJson(updateResponse);
    // print(response.body);
    updateCode = updateResponse['code'];
    newToken = refreshData.token;
    newRefToken = refreshData.refreshToken;
    print('newRefToken $newRefToken');
    await sharedPreferences.setString('jwt', newToken);
    await sharedPreferences.setString('refreshToken', newRefToken);
    // print("updateToken: ${sharedPreferences.get('token')}");
    clientCode = updateResponse['client_uuid'];
    // print("newRefToken: ${updateResponse['refresh_token']}");
  } else {
    updateResponse = json.decode(response.body);
    updateCode = updateResponse['code'];
    print("Error refresh with code: ${response.body}");
  }
  return refreshData;
}
