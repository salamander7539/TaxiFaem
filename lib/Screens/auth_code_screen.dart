import 'package:flutter_faem_app/Get/init_data.dart';
import 'package:flutter_faem_app/Post/auth_code_data_pass.dart';
import 'package:flutter_faem_app/Screens/main_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../app.dart';
import 'auth_phone_screen.dart';

class AuthCodeScreen extends StatefulWidget {
  @override
  _AuthCodeScreenState createState() => _AuthCodeScreenState();
}

final Stopwatch stopwatch = new Stopwatch();

Position currentPosition;

String pin, deviceId;

class _AuthCodeScreenState extends State<AuthCodeScreen> {
  TextEditingController pinController = new TextEditingController();
  Color buttonCodeColor, buttonCodeTextColor;
  bool buttonCodeEnable, smsWarning;
  SharedPreferences sharedPreferences;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


  getToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String token = await _firebaseMessaging.getToken();
    fcmToken = token;
    print("FCM-token: $fcmToken");
    sharedPreferences.setString('fcmToken', '$fcmToken');
  }

  checkLoginStatus() async {
    await getInitData();
    print(clientUuid);
    if (clientUuid != null) {
      setState(() {
        globalCheck = true;
      });
    } else {
      setState(() {
        globalCheck = false;
      });
    }
    print(globalCheck);
  }

  @override
  void initState() {
    super.initState();
    buttonCodeColor = Color(0xFFF3F3F3);
    buttonCodeTextColor = Colors.black;
    buttonCodeEnable = true;
    smsWarning = false;
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
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            phone = null;
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                phone = null;
              });
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
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
                        "Введите код из смс",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "UniNeue",
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Container(
                          child: PinInputTextField(
                            autoFocus: true,
                            controller: pinController,
                            pinLength: 4,
                            decoration: UnderlineDecoration(
                              hintText: "0000",
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                              ),
                              colorBuilder: PinListenColorBuilder(
                                Color(0xFFFD6F6D),
                                Color(0xFFFD6F6D),
                              ),
                            ),
                            // inputFormatter: <TextInputFormatter>[
                            //   WhitelistingTextInputFormatter.digitsOnly
                            // ],
                            onChanged: (String newPin) async {
                              if (this.mounted) {
                                setState(() {
                                  pin = newPin;
                                  // print("pin: $pin");
                                  if (pin.length == 4) {
                                    buttonCodeColor = Color(0xFFFD6F6D);
                                    buttonCodeTextColor = Colors.white;
                                    buttonCodeEnable = false;
                                  } else {
                                    buttonCodeColor = Color(0xFFF3F3F3);
                                    buttonCodeTextColor = Colors.black;
                                    buttonCodeEnable = true;
                                    smsWarning = false;
                                  }
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: smsWarning,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            "Вы ввели неверный смс код",
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
                  // Visibility(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Container(
                  //       height: 20.0,
                  //       child: FlatButton(
                  //         onPressed: () async {
                  //           PopUp.showInternetDialog('Ожидайте звонка оператора');
                  //           await remindPassword();
                  //         },
                  //         color: Colors.transparent,
                  //         child: Text(
                  //           remindMessage != null ? remindMessage : '',
                  //           style: TextStyle(
                  //             color: (Color(0xFF979797)),
                  //             fontSize: 13.0,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //   visible: remindMessage != null ? true : false,
                  // ),
                  AbsorbPointer(
                    absorbing: buttonCodeEnable,
                    child: Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(11.0)),
                          ),
                          color: buttonCodeColor,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Готово",
                              style: TextStyle(
                                color: buttonCodeTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (pin.length == 4) {
                              deviceId = await PlatformDeviceId.getDeviceId;
                              await loadAuthCodeData(deviceId, int.parse(pin));
                              sharedPreferences =
                                  await SharedPreferences.getInstance();
                              if (authPassCode != null) {
                                milliseconds = (DateTime.now().millisecondsSinceEpoch / 1000).round();
                                // print("time: $milliseconds ");
                                await getToken();
                                await checkLoginStatus();
                                await
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
                                pinController.clear();
                              } else {
                                if (this.mounted) {
                                  setState(() {
                                    pinController.clear();
                                    smsWarning = true;
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
}
