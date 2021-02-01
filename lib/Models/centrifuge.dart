import 'dart:convert';

import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'dart:convert' as convert;
import 'package:flutter_faem_app/Get/getCentrifuge.dart';
import 'AuthCode.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

AuthCodeData authCodeData;

class Centrifuge {
  static centrifuge.Client client;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  new FlutterLocalNotificationsPlugin();

  static Future<void> connectToServer() async {
    client = centrifuge.createClient('wss://centrifugo.stage.faem.pro/connection/websocket?format=protobuf');

    var android = new AndroidInitializationSettings('@mipmap/faem');
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(platform);

    String token = await getCentrifugeToken();
    client.setToken(token);
    client.connectStream.listen((event) {
      print('Centrifugo connected');
    });
    client.disconnectStream.listen((event) {
      print('Centrifugo disconnected');
    });
    client.connect();

    final subscription = client.getSubscription('client/' + authCodeData.client_uuid);

    subscription.publishStream.listen((event){
      var parsedJson = convert.jsonDecode(utf8.decode(event.data));
      // showNotification(parsedJson);
      // messageHandler(parsedJson);
      print("STATUS TUT" + utf8.decode(event.data));
    });

    subscription.subscribe();
  }

}