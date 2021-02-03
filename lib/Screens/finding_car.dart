import 'package:flutter/material.dart';
import 'package:flutter_faem_app/Get/get_my_orders.dart';
import 'package:flutter_faem_app/Models/MyOrdersList.dart';
import 'package:flutter_faem_app/Put/cancel_order.dart';

GlobalKey<FindingCarPageState>findingCarScreenKey = new GlobalKey<FindingCarPageState>(debugLabel: 'findingCarScreenKey');


class FindingCarPage extends StatefulWidget {
  FindingCarPage() : super(key: findingCarScreenKey);

  @override
  FindingCarPageState createState() => FindingCarPageState();
}

var TaxiStates = [
  'order_created',
  'smart_distribution',
  'finding_driver',
  'offer_rejected',
  'offer_offered',
  'driver_accepted',
  'driver_not_found',
  'offer_cancelled',
  'order_start',
  'on_place',
  'on_the_way',
  'waiting',
  'order_payment',
  'finished'
];

class FindingCarPageState extends State<FindingCarPage> with WidgetsBindingObserver{
  List<MyOrders> ordersList;

  Container _findingCar(BuildContext context, orderUuid) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black.withOpacity(0.0),
      child: Container(
        height: height * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15.0),
            topRight: const Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 40.0,
                child: Text(
                  'Поиск машины',
                  style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                height: height * .2,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width:width * .4,
                      height: height * .1,
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
                        onPressed: () async {
                          int respCode = await cancelOrder(orderUuid);
                          if(respCode == 200) {
                            Navigator.pop(context);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.close),
                            Transform(
                              transform: Matrix4.translationValues(20, 0, 0),
                              child: Text(
                                'Отменить', style: TextStyle(fontSize: 17.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //   Container(
                    //   width: width * .4,
                    //   height: height * .1,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(11.0),
                    //     color: Colors.white,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.3),
                    //         spreadRadius: 1,
                    //         blurRadius: 10,
                    //         offset: Offset(2, 0), // changes position of shadow
                    //       ),
                    //     ],
                    //   ),
                    //   child: FlatButton(
                    //     onPressed: () {},
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Icon(Icons.add),
                    //         Transform(
                    //           transform: Matrix4.translationValues(7, 0, 0),
                    //           child: Text(
                    //             'Заказать еще\nмашину',
                    //             style: TextStyle(fontSize: 17.0),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _orderStatusContainer(context, titleState, carName, registryNumber) {
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
                  Text(titleState, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
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
                  Text(carName, style: TextStyle(fontSize: 17.0),),
                  Container(
                    width: 100.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFEBEAEF),
                      ),
                      borderRadius: BorderRadius.circular(27.0),
                    ),
                    child: Center(child: Text(registryNumber, style: TextStyle(fontSize: 17.0),)),
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
                            transform: Matrix4.translationValues(30, 0, 0),
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MyOrders>>(
        future: getMyOrders(),
        // ignore: missing_return
        builder: (context, AsyncSnapshot<List<MyOrders>> snapshot) {
          // String status = snapshot.data[0].stateTitle;
          // String carName = snapshot.data[0].driver.car;
          // String registryNumber = snapshot.data[0].driver.regNumber;
          if (snapshot.hasData) {
            ordersList = snapshot.data;
            if (snapshot.data[0].driver.car == null
            // snapshot.data[0].state == "order_created" || snapshot.data[0].state == "smart_distribution" || snapshot.data[0].state == "finding_driver" || snapshot.data[0].state == "offer_rejected" || snapshot.data[0].state == "driver_not_found"
            ) {
              return _findingCar(context, snapshot.data[0].uuid);
            } else {
              return _orderStatusContainer(context, snapshot.data[0].stateTitle, snapshot.data[0].driver.car, snapshot.data[0].driver.regNumber);
            }
          } else {
            return Container(
                color: Colors.black.withOpacity(0.0),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                    ),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            );
          }
        }
    );
//    return _findingCar(context);
  }
}
