import 'package:flutter_faem_app/Models/GetAllTariffModel.dart';
import 'package:flutter_faem_app/Models/Options.dart';
import 'package:flutter_faem_app/Post/create_order.dart';
import 'package:flutter_faem_app/Post/get_tariff.dart';
import 'package:flutter_faem_app/Post/post_all_tariff.dart';
import 'package:flutter_faem_app/Screens/features_screen.dart';
import 'package:flutter_faem_app/Screens/main_map_screen.dart';
import 'package:flutter_faem_app/Screens/pay_method_screen.dart';
import 'package:flutter_faem_app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'order_status_screen.dart';
import 'finding_car.dart';
import '../app.dart';

import 'create_order_screen.dart';

class MakeOrder extends StatefulWidget {
  @override
  _MakeOrderState createState() => _MakeOrderState();
}

TextEditingController startPointController = new TextEditingController();
TextEditingController endPointController = new TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKeyMake = GlobalKey<ScaffoldState>();
List<String> checkedFeatures = [];
double sliderValue = 0;
var priceValue = 0;
var chosenServiceUuid;
String payMethod;

final String ellipseIm = 'assets/svg_images/ellipse.svg';
final Widget ellipseSvg = SvgPicture.asset(
  ellipseIm,
  semanticsLabel: 'ellipse',
);
final Widget ellipseSvg2 = SvgPicture.asset(
  ellipseIm,
  color: Colors.blue,
  semanticsLabel: 'ellipse',
);

class _MakeOrderState extends State<MakeOrder> {
  List<String> service = [];
  bool priceVisible;

  _openPayMethod(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.45,
        child: PayMethod(),
      ),
    );
  }


  Container _findingCar(context) {
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15.0),
            topRight: const Radius.circular(15.0),
          ),
        ),
        child: ListView(
          children: [

          ],
        ),
      ),
    );
  }

  sharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('payMethod') != null) {
      payMethod = sharedPreferences.getString('payMethod');
    } else {
      payMethod = 'Наличные';
    }
    return payMethod;
  }

  // getServiceData() async {
  //   serviceItem = await getServices();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getServiceData();
    chosenServiceUuid = 'b65d4d24-6df0-4630-a87e-e296447b04c5';
    priceVisible = true;
    sharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKeyMake,
      body: FutureBuilder<List<GetAllTariff>>(
          future: getAllTariff(checkedFeatures),
          // ignore: missing_return
          builder: (context, /*AsyncSnapshot<List<GetAllTariff>>*/ snapshot) {
            if (snapshot.hasData) {
              return Container(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                    ),
                  ),
                  child: serviceItem.length != 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: ellipseSvg,
                                    ),
                                    Flexible(
                                      flex: 7,
                                      child: TextField(
                                        controller: startPointController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'Адрес подачи',
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: Color(0xFFEDEDED),
                                      thickness: 1,
                                      width: 1,
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        child: FlatButton(
                                          child: Text(
                                            'Уточнить',
                                            style: TextStyle(fontSize: 12.5),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: ellipseSvg2,
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: TextField(
                                      controller: endPointController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: 'Куда?',
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Color(0xFFEDEDED),
                                    thickness: 1,
                                    width: 1,
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        child: IconButton(
                                          onPressed: () async {},
                                          icon: Icon(
                                            Icons.add,
                                            size: 16.0,
                                            color: Colors.black,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                height: 65.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.symmetric(
                                      horizontal: BorderSide(
                                          color: Colors.grey, width: 0.15)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.5),
                                      child: GestureDetector(
                                        onTap: () async {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FeaturesPage()));
                                        },
                                        child: Container(
                                          height: double.infinity,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .5,
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.circle,
                                              color: Color(0xFFFC5B58),
                                            ),
                                            title: Transform(
                                                transform:
                                                    Matrix4.translationValues(
                                                        -20, 0, 0),
                                                child: Text('Пожелания')),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Transform(
                                      transform:
                                          Matrix4.translationValues(10, -4, 0),
                                      child: Container(
                                        height: double.infinity,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        child: FlatButton(
                                          onPressed: () {
                                            _openPayMethod(context);
                                          },
                                          child: ListTile(
                                            title: Text(
                                              'Способ оплаты',
                                              textAlign: TextAlign.end,
                                            ),
                                            subtitle: Text(payMethod,
                                                textAlign: TextAlign.end),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.16,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.hasData
                                          ? snapshot.data.length
                                          : 0,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(11.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: chosenServiceUuid ==
                                                        snapshot.data[index]
                                                            .serviceUuid
                                                    ? Colors.grey
                                                        .withOpacity(0.3)
                                                    : Colors.transparent,
                                                spreadRadius: 1,
                                                blurRadius: 10,
                                                offset: Offset(2,
                                                    0), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.55,
                                          child: Card(
                                            margin: EdgeInsets.all(8.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11.0),
                                            ),
                                            elevation: 0.0,
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            child: FlatButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                setState(() {
                                                  chosenServiceUuid = snapshot
                                                      .data[index].serviceUuid;
                                                });
                                              },
                                              child: ListTile(
                                                dense: true,
                                                // leading: Container(
                                                //   child: Icon(
                                                //     Icons.car_rental,
                                                //     color: Colors.white,
                                                //   ),
                                                // ),
                                                leading: snapshot
                                                            .data[index]
                                                            .serviceImagesSet
                                                            .fullFormat ==
                                                        null
                                                    ? null
                                                    : Container(
                                                        height: 20.0,
                                                        width: 60.0,
                                                        child: chosenServiceUuid !=
                                                                snapshot
                                                                    .data[index]
                                                                    .serviceUuid
                                                            ? Image.network(
                                                                snapshot
                                                                    .data[index]
                                                                    .serviceImagesSet
                                                                    .fullFormat,
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.3),
                                                                colorBlendMode:
                                                                    BlendMode
                                                                        .modulate,
                                                              )
                                                            : Image.network(
                                                                snapshot
                                                                    .data[index]
                                                                    .serviceImagesSet
                                                                    .fullFormat,
                                                              )),
                                                title: Container(
                                                  child: Text(
                                                    "${snapshot.data[index].name}",
                                                    style: TextStyle(
                                                      color: chosenServiceUuid ==
                                                              snapshot
                                                                  .data[index]
                                                                  .serviceUuid
                                                          ? Colors.black
                                                          : Color(0xFF9B9B9B),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                subtitle: priceVisible == true
                                                    ? Text(
                                                        "${snapshot.data[index].totalPrice} ₽",
                                                        style: TextStyle(
                                                            color: chosenServiceUuid ==
                                                                    snapshot
                                                                        .data[
                                                                            index]
                                                                        .serviceUuid
                                                                ? Colors.black
                                                                : Color(
                                                                    0xFF9B9B9B),
                                                            fontSize: 12.0),
                                                      )
                                                    : Text(
                                                        "",
                                                        style: TextStyle(
                                                            color: chosenServiceUuid ==
                                                                    snapshot
                                                                        .data[
                                                                            index]
                                                                        .serviceUuid
                                                                ? Colors.black
                                                                : Color(
                                                                    0xFF9B9B9B),
                                                            fontSize: 12.0),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Container(
                                  height: 50.0,
                                  width: double.infinity,
                                  // child: Slider(
                                  //   min: -5.0,
                                  //   max: 50,
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       sliderValue = value;
                                  //       priceVisible = false;
                                  //     });
                                  //   },
                                  //   onChangeEnd: (value) {
                                  //     setState(() {
                                  //       priceVisible = true;
                                  //     });
                                  //   },
                                  //   value: sliderValue,
                                  // ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 60.0,
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFD6F6D),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: FlatButton(
                                    onPressed: () async {
                                      // await createOrder(chosenServiceUuid);
                                      await createOrder(chosenServiceUuid);
                                      if(orderUuid != null) {
                                        Navigator.pop(context);
                                        mainScaffoldKey.currentState
                                            .showBottomSheet((context) =>
                                            FindingCarPage());
                                      }
                                    },
                                    child: Text(
                                      'Вызвать такси',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              );
            } else {
              return Container(
                color: Color(0xFF737373),
                child: Container(
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
                ),
              );
            }
          }),
    );
  }
}
