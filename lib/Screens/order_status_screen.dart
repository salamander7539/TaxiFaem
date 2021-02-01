import 'package:flutter_faem_app/Get/get_my_orders.dart';
import 'package:flutter_faem_app/Models/MyOrdersList.dart';
import 'package:flutter/material.dart';

class OrderStatusScreen extends StatefulWidget {
  @override
  _OrderStatusScreenState createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      child: Container(
        height: 300.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15.0),
            topRight: const Radius.circular(15.0),
          ),
        ),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFEDEDED),
                  ),
                ),
              ),
              width: double.infinity,
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Машина на подходе', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
                ],
              ),
            ),
            Container(
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFEDEDED),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('snapshot.data[0].driver.car', style: TextStyle(fontSize: 17.0),),
                  Container(
                    width: 100.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFEBEAEF),
                      ),
                      borderRadius: BorderRadius.circular(27.0),
                    ),
                    child: Text('snapshot.data[0].driver.regNumber', style: TextStyle(fontSize: 17.0),),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 150.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 170.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(2, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: FlatButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.call, color: Color(0xFF45C64E),),
                          Transform(
                            transform: Matrix4.translationValues(20, 0, 0),
                            child: Text(
                              'Позвонить', style: TextStyle(fontSize: 17.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 170.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(2, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: FlatButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.chat_outlined, color: Color(0xFF45C64E),),
                          Transform(
                            transform: Matrix4.translationValues(15, 0, 0),
                            child: Text(
                              'Чат', style: TextStyle(fontSize: 17.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
