import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class SettingsModel{
  static SettingsModel _settings;
  bool no_call;
  bool no_offer;

  SettingsModel( {
    this.no_call,
    this.no_offer,
  });

  static Future saveData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('settings', SettingsModel.toJson());
  }

  static Future<SettingsModel> getSettings() async{
    if(_settings != null)
      return _settings;

    _settings = new SettingsModel(no_call: false,no_offer: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('settings'))
      return _settings;
    var json_settings = convert.jsonDecode(prefs.getString('settings'));

    _settings = SettingsModel.fromJson(json_settings);
    return _settings;
  }

  static String toJson(){

    Map<String, dynamic> item =
    {
      "no_call": _settings.no_call,
      "no_offer": _settings.no_offer,
    };
    return convert.jsonEncode(item);
  }

  factory SettingsModel.fromJson(Map<String, dynamic> parsedJson){
    return new SettingsModel(
        no_call:parsedJson['no_call'],
        no_offer: parsedJson['no_offer']
    );
  }
}