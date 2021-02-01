import 'dart:convert';
import 'package:flutter_faem_app/Models/Auth.dart';
import 'package:flutter_faem_app/Models/FindAddressModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

var addressValue, addressData;

Future<AddressData> findAddress(double lat, double lng) async {
  AddressData findAddressData = null;
  var json_request = jsonEncode({
      "lat": double.parse(lat.toStringAsFixed(4)),
      "long": double.parse(lng.toStringAsFixed(4))
  });
  var url = 'https://client.apis.stage.faem.pro/api/v2/findaddress';
  var response = await http.post(url, body: json_request, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  // print(json_request);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    addressData = response.body;
    findAddressData = new AddressData.fromJson(jsonResponse);
    addressValue = findAddressData.unrestrictedValue;
  } else {
    // print('Request FIND ADDRESS failed with status: ${response.statusCode}.');
  }
  // print(response.body);
  return findAddressData;
}