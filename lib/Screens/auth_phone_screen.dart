import 'dart:async';

import 'package:flutter_faem_app/Models/Auth.dart';
import 'package:flutter_faem_app/Post/auth_data_pass.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import '../app.dart';
import 'auth_code_screen.dart';


String driverName, phone, deviceId;
var answerOrderState;

class AuthPhoneScreen extends StatefulWidget {
  @override
  _AuthPhoneScreenState createState() => _AuthPhoneScreenState();
}

class _AuthPhoneScreenState extends State<AuthPhoneScreen> {
  // final TextEditingController _phoneController = new TextEditingController();
  // MaskTextInputFormatter maskTextInputFormatter = MaskTextInputFormatter(
  //     mask: "+7 ### ###-##-##", filter: {"#": RegExp(r'[0-9]')});
  var maskController = new MaskedTextController(mask: '+7 000 000-00-00');


  Color buttonPhoneColor, buttonPhoneTextColor;
  bool buttonPhoneEnable, phoneWarning, serviceWarning;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future _showNotification(Map<String, dynamic> message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel desc',
      importance: Importance.Max,
      priority: Priority.High,
    );

    var platformChannelSpecifics =
        new NotificationDetails(androidPlatformChannelSpecifics, null);
    await flutterLocalNotificationsPlugin.show(
      0,
      message['notification']['title'],
      message['notification']['body'],
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  getToken() async {
    String token = await _firebaseMessaging.getToken();
    fcmToken = token;
    // print("FCM-token: $fcmToken");
  }

  Future selectNotification(String payload) async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  @override
  void initState() {
    super.initState();
    maskController.beforeChange = (String previous, String next) {
      if(maskController.text == '8') {
        maskController.updateText('+7 ');
      }
      return true;
    };
    buttonPhoneColor = Color(0xFFF3F3F3);
    buttonPhoneTextColor = Colors.black;
    phoneWarning = false;
    serviceWarning = false;
    buttonPhoneEnable = true;
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettings =
        InitializationSettings(initializationSettingsAndroid, null);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        // print("onMessage: $message");
        var notification = message['notification'];
        // print('Notification: ${notification['body']}');
      },
      onResume: (Map<String, dynamic> message) async {
        // print("onResume: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        // print("onLaunch: $message");
      },
    );

    getToken();
  }


  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
                child: Container(
                  color: Color(0xFFECEEEC),
                  height: 1.0,
                ),
                preferredSize: Size.fromHeight(1.0)),
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 76.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Ваш номер телефона",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "UniNeue",
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.start,
                          controller: maskController,
                          autofocus: true,
                          // inputFormatters: [maskTextInputFormatter],
                          autocorrect: false,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            // suffixIcon: IconButton(
                            //   icon: Icon(Icons.close),
                            //   onPressed: () {
                            //     maskTextInputFormatter.formatEditUpdate(TextEditingValue(text: _phoneController.value.text, selection: TextSelection(baseOffset: 0, extentOffset: _phoneController.value.text.length)), TextEditingValue.empty);
                            //     _phoneController.value = TextEditingValue.empty;
                            //   },
                            // ),
                            border: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                color: Color(0xFFFD6F6D),
                              ),
                            ),
                            contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.275),
                            hintText: '+7 999 949-94-99',
                            hintStyle: TextStyle(
                              color: Color(0xFFC0BFC6),
                              fontSize: 20.0,
                            ),
                            focusColor: Color(0xFFFD6F6D),
                            enabledBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                color: Color(0xFFFD6F6D),
                              ),
                            ),
                            focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                color: Color(0xFFFD6F6D),
                                width: 2.0,
                              ),
                            ),
                          ),
                          onChanged: (String newPhone) {
                            if(newPhone == '+7 8'){
                              maskController.text = '+7';
                            }
                            if (this.mounted) {
                              setState(() {
                                phone = newPhone;
                                // print(phone);
                                if (phone.length == 16) {
                                  buttonPhoneColor = Color(0xFFFD6F6D);
                                  buttonPhoneTextColor = Colors.white;
                                  buttonPhoneEnable = false;
                                } else {
                                  buttonPhoneColor = Color(0xFFF3F3F3);
                                  buttonPhoneTextColor = Colors.black;
                                  buttonPhoneEnable = true;
                                  phoneWarning = false;
                                  serviceWarning = false;
                                }
                              });
                            }
                          },
                        ),
                        Visibility(
                          visible: phoneWarning,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Text(
                                "Указан неверный номер",
                                style: TextStyle(
                                    color: Color(0xFFEE4D3F),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: serviceWarning,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Text(
                                "Ошибка 503",
                                style: TextStyle(
                                    color: Color(0xFFEE4D3F),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  style: urlLinkText(),
                                  text:
                                      'Нажимая кнопку “Далее”, вы принимете условия ',
                                ),
                                TextSpan(
                                  style: urlLinkText().copyWith(
                                      decoration: TextDecoration.underline),
                                  text: 'Пользовательского соглашения ',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      final url = 'https://faem.ru/legal/agreement';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      }
                                    },
                                ),
                                TextSpan(
                                  style: urlLinkText(),
                                  text: 'и ',
                                ),
                                TextSpan(
                                  style: urlLinkText().copyWith(
                                      decoration: TextDecoration.underline),
                                  text: 'Политики конфиденцальности',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      final url = 'https://faem.ru/privacy';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      }
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AbsorbPointer(
                        absorbing: buttonPhoneEnable,
                        child: Container(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(11.0)),
                              ),
                              color: buttonPhoneColor,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "Далее",
                                  style: TextStyle(
                                    color: buttonPhoneTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (maskController.text.length == 16) {
                                  phone = phone.replaceAll('-', '');
                                  phone = phone.replaceAll(' ', '');
                                  // print(phone);
                                  deviceId = await PlatformDeviceId.getDeviceId;
                                  print('Device' + deviceId);
                                  await loadAuthData(deviceId, phone);
                                  if (authCode == 200) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => AuthCodeScreen()));
                                    if (this.mounted) {
                                      setState(() {
                                        // maskTextInputFormatter.formatEditUpdate(TextEditingValue(text: _phoneController.value.text, selection: TextSelection(baseOffset: 0, extentOffset: _phoneController.value.text.length)), TextEditingValue.empty);
                                        maskController.value = TextEditingValue.empty;
                                      });
                                    }
                                  } else if (authCode >= 500) {
                                    setState(() {
                                      // maskTextInputFormatter.formatEditUpdate(TextEditingValue(text: _phoneController.value.text, selection: TextSelection(baseOffset: 0, extentOffset: _phoneController.value.text.length)), TextEditingValue.empty);
                                      maskController.value = TextEditingValue.empty;
                                      serviceWarning = true;
                                    });
                                  }
                                  else {
                                    if (this.mounted) {
                                      setState(() {
                                        // maskTextInputFormatter.formatEditUpdate(TextEditingValue(text: _phoneController.value.text, selection: TextSelection(baseOffset: 0, extentOffset: _phoneController.value.text.length)), TextEditingValue.empty);
                                        maskController.value = TextEditingValue.empty;
                                        phoneWarning = true;
                                      });
                                    }
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }

  // getPhone() {
  //   phoneText = RichText(
  //     text: TextSpan(
  //       children: [
  //         TextSpan(
  //           text: "+7 ",
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 20.0,
  //           )
  //         ),
  //         TextSpan(
  //             text: "999 949-99-94",
  //             style: TextStyle(
  //               color: Color(0xFFC0BFC6),
  //               fontSize: 20.0,
  //             )
  //         ),
  //       ]
  //     ),
  //   );
  // }

  TextStyle urlLinkText() {
    return TextStyle(
      color: (Color(0xFF979797)),
      fontSize: 13.0,
      fontWeight: FontWeight.bold,
    );
  }
}
