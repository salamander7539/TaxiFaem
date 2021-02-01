import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopUp {
  static showInternetDialog(String message) async {
    Fluttertoast.showToast(
        msg: message,
      // "Ошибка подключения к интернету! \nПроверьте ваше интернет-соединение!"
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xFFF3F3F3),
        textColor: Colors.black,
        fontSize: 16.0,
    );
  }
}