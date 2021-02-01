import 'package:flutter_faem_app/Get/init_data.dart';
import 'package:flutter_faem_app/Screens/auth_phone_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: true,
                  child: GestureDetector(
                    onTap: () {
                      print('TAP');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthPhoneScreen()));
                    },
                    child: Container(
                      height: globalCheck == false ?  60.0 : 40.0,
                      color: globalCheck == false ? Color(0xFFFC5B58) : Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: globalCheck == false ? Text('Введите номер телефона',
                            style: TextStyle(color: Colors.white),
                          ) : Text('$clientPhoneNumber',
                            style: TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Способы оплаты'),
                ),
                Visibility(
                  visible: globalCheck,
                  child: ListTile(
                    title: Text('Бонусы'),
                  ),
                ),
                Visibility(
                  visible: globalCheck,
                  child: ListTile(
                    title: Text('История поездок'),
                  ),
                ),
                Visibility(
                  visible: globalCheck,
                  child: ListTile(
                    title: Text('Мои адреса'),
                  ),
                ),
                ListTile(
                  title: Text('Настройки'),
                ),
                ListTile(
                  title: Text('Информация'),
                ),
                ListTile(
                  title: Text('Служба поддержки'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ListView(
// children: [
// DrawerHeader(
// child: Text('Введите номер телефона'),
// ),
// ListTile(
// title: Text('Способы оплаты'),
// ),
// Visibility(
// visible: false,
// child: ListTile(
// title: Text('Бонусы'),
// ),
// ),
// Visibility(
// visible: false,
// child: ListTile(
// title: Text('История поездок'),
// ),
// ),
// Visibility(
// visible: false,
// child: ListTile(
// title: Text('Мои адреса'),
// ),
// ),
// ListTile(
// title: Text('Настройки'),
// ),
// ListTile(
// title: Text('Информация'),
// ),
// ListTile(
// title: Text('Служба поддержки'),
// ),
// ],
// ),
