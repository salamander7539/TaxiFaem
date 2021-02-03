import 'dart:convert';

import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'dart:convert' as convert;
import 'package:flutter_faem_app/Get/getCentrifuge.dart';
import 'package:flutter_faem_app/Get/get_my_orders.dart';
import 'package:flutter_faem_app/Get/get_order.dart';
import 'package:flutter_faem_app/Screens/finding_car.dart';
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
      print('Centrifuge connected');
    });
    client.disconnectStream.listen((event) {
      print('Centrifuge disconnected');
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


  static Future<void> OrderCheckingUpdater(String order_uuid, String order_state) async {
    if (findingCarScreenKey.currentState != null && findingCarScreenKey.currentState.ordersList != null
    && !TaxiStates.contains(order_state)) {
      findingCarScreenKey.currentState.ordersList.removeWhere((element) => element.uuid == order_uuid);
      if(findingCarScreenKey.currentState.ordersList.length == 0)
        findingCarScreenKey.currentState.setState(() { });
    }
    if(findingCarScreenKey.currentState != null && findingCarScreenKey.currentState.ordersList != null
        && !TaxiStates.contains(order_state)){
      findingCarScreenKey.currentState.ordersList.removeWhere((element) => element.uuid == order_uuid);
      if(findingCarScreenKey.currentState.ordersList.length == 0)
        findingCarScreenKey.currentState.setState(() { });
    }
//     if(orderCheckingStates.containsKey(order_uuid)) {
//       if(orderCheckingStates[order_uuid].currentState != null) {
//         orderCheckingStates[order_uuid].currentState.ordersStoryModelItem = await getOrder(order_uuid);
//         orderCheckingStates[order_uuid].currentState.setState(() {
// //          orderCheckingStates[order_uuid].currentState.ordersStoryModelItem
// //              .state = order_state;
//         });
//       } else {
//         if(homeScreenKey.currentState != null && homeScreenKey.currentState.orderList != null) {
//           homeScreenKey.currentState.orderList.forEach((element) async {
//             if(element.ordersStoryModelItem.uuid == order_uuid) {
//               element.ordersStoryModelItem = await getOrder(order_uuid);
// //              element.ordersStoryModelItem.state = order_state;
//               return;
//             }
//           });
//         }
//       }
//     }
  }


  static void messageHandler(Map<String, dynamic> message) async {

    //ios fix
    print(message);
    if(!message.containsKey('data') && (message.containsKey('payload') || message.containsKey('tag'))){
      message['data'] = new Map<String, dynamic>();
      if(message.containsKey('payload')){
        message['data']['payload'] = message['payload'];
      }
      if(message.containsKey('tag')){
        message['data']['tag'] = message['tag'];
      }
      if(message.containsKey('notification_message')){
        message['data']['notification_message'] = message['notification_message'];
      }
    }
    print(message);


    // if (message.containsKey('data')) {
    //   var data =  message['data'];
    //   if(data.containsKey('tag')) {
    //     switch (data['tag']){
    //       case 'order_state' :
    //         var payload = data['payload'];
    //         String order_state = payload['state'];
    //         String order_uuid = payload['order_uuid'];
    //         OrderCheckingUpdater(order_uuid, order_state);
    //         break;
    //
    //       case 'chat_message' :
    //         var payload = data['payload'];
    //         var message = ChatMessage.fromJson(payload);
    //         if(chatKey.currentState != null){
    //           chatKey.currentState.setState(() {
    //             chatKey.currentState.chatMessageList.insert(0, new ChatMessageScreen(chatMessage: message, key: new ObjectKey(message)));
    //           });
    //         }
    //         String order_uuid = message.order_uuid;
    //         if(orderCheckingStates.containsKey(order_uuid)) {
    //           if(orderCheckingStates[order_uuid].currentState != null) {
    //             orderCheckingStates[order_uuid].currentState.setState(() {
    //             });
    //           }
    //         }
    //         break;
    //
    //       case 'chat_messages_read' :
    //         var payload = data['payload'];
    //         List<dynamic> messagesUuid = payload['messages_uuid'];
    //         if(chatKey.currentState != null && chatKey.currentState.order_uuid == payload['order_uuid']){
    //           messagesUuid.forEach((element) {
    //             if(chatMessagesStates.containsKey(element)){
    //               // ignore: invalid_use_of_protected_member
    //               if(chatMessagesStates[element].currentState != null) {
    //                 chatMessagesStates[element].currentState.setState(() {
    //                   chatMessagesStates[element].currentState.chatMessage.ack = true;
    //                 });
    //               } else {
    //                 chatKey.currentState.chatMessageList.forEach((message) {
    //                   if(message.chatMessage.uuid == element) {
    //                     message.chatMessage.ack = true;
    //                     return;
    //                   }
    //                 });
    //               }
    //             }
    //           });
    //         }
    //         break;
    //     }
    //   }
    // }
  }


  static Future<void> showNotification(Map<String, dynamic> message) async {

    String title = message['title'];
    String body = message['message'];
    //for ios
//    String title_ios = message['title'];
    if(title == null || title == '')
      return;
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID',
      'CHANNEL_NAME',
      "CHANNEL_DESCRIPTION",
      importance: Importance.Max,
      priority: Priority.High,
      playSound: true,
      timeoutAfter: 5000,
      styleInformation: DefaultStyleInformation(true, true),
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
    NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,  // Notification ID
      title, // Notification Title
      body, // Notification Body, set as null to remove the body
      //for ios change body on empty field
//      title_ios,
//      '',
      platformChannelSpecifics,
      payload: 'New Payload', // Notification Payload
    );
  }
}

