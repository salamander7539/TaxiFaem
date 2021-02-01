import 'package:flutter/material.dart';
import '../app.dart';
import 'make_order_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayMethod extends StatefulWidget {
  @override
  _PayMethodState createState() => _PayMethodState();
}

String checkMethod;

class _PayMethodState extends State<PayMethod> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkMethod = payMethod;
    sharedPrefMethod();
  }

  sharedPrefMethod() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF737373),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15.0),
              topRight: const Radius.circular(15.0),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50.0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () async {
                      payMethod = checkMethod;
                      await sharedPreferences.setString('payMethod', payMethod);
                      Navigator.pop(context);
                    },
                    child: Text('Готово',
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 60.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      checkMethod = 'Наличные';
                    });
                  },
                  child: ListTile(
                    leading: Transform(
                      transform: Matrix4.translationValues(-15, 0, 0),
                      child: Icon(Icons.money),
                    ),
                    title: Transform(
                      transform: Matrix4.translationValues(-35, 0, 0),
                      child: Text('Наличными'),
                    ),
                    trailing: Icon(Icons.check_circle_outline,
                      size: 40.0,
                      color: checkMethod != 'Наличные' ? Colors.grey : Color(0xFFFD6F6D),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 60.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      checkMethod = 'Онлайн-перевод';
                    });
                  },
                  child: ListTile(
                    leading: Transform(
                      transform: Matrix4.translationValues(-15, 0, 0),
                      child: Icon(Icons.phone_android),
                    ),
                    title: Transform(
                      transform: Matrix4.translationValues(-35, 0, 0),
                      child: Text('Онлайн-перевод'),
                    ),
                    trailing: Icon(Icons.check_circle_outline,
                      size: 40.0,
                      color: checkMethod != 'Онлайн-перевод' ? Colors.grey : Color(0xFFFD6F6D),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
