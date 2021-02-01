import 'package:flutter_faem_app/Get/get_features.dart';
import 'package:flutter_faem_app/Models/GetTariffData.dart';
import 'package:flutter_faem_app/Models/Options.dart';
import 'package:flutter_faem_app/Post/get_tariff.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'make_order_screen.dart';

class FeaturesPage extends StatefulWidget {
  @override
  _FeaturesPageState createState() => _FeaturesPageState();
}


List<int> indexes = [];
var priceAddition = 0;


class _FeaturesPageState extends State<FeaturesPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Feature>>(
      future: getFeatures(),
      builder: (context, /*AsyncSnapshot<List<Feature>>*/ snapshot) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, color: Colors.black,),
            ),
          ),
          body: snapshot.hasData == true ?
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Пожелания', style: TextStyle(fontSize: 20.0),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 0.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .45,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${snapshot.data[index].name}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${snapshot.data[index].price} ₽",
                                style: TextStyle(fontSize: 16.0),
                              ),
                              CupertinoSwitch(
                                  value: checkedFeatures.contains(snapshot.data[index].uuid) ? true : false,
                                  activeColor: Color(0xFFFD6F6D),
                                  onChanged: (value) {
                                    if(checkedFeatures.contains(snapshot.data[index].uuid)) {
                                      setState(() {
                                        checkedFeatures.remove(snapshot.data[index].uuid);
                                      });
                                    } else {
                                      setState(() {
                                        checkedFeatures.add(snapshot.data[index].uuid);
                                      });
                                    }
                                    print(checkedFeatures);
                                  }),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: double.infinity,
                      child: ListTile(
                        title: Text('Изменить стоимость поездки'),
                        subtitle: Text('Вероятность подбора машины выше в зеленой зоне'),
                      ),
                    ),
                    Slider(
                      min: -5.0,
                      max: 50,
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                      value: sliderValue,
                    ),
                  ],
                ),
              ),
              FutureBuilder<GetTariff>(
                future: getTariff(chosenServiceUuid, checkedFeatures),
                // ignore: missing_return
                builder: (context, AsyncSnapshot<GetTariff> snap) {
                  if (snap.hasData) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .145,
                      child: ListTile(
                        title: Text('Стоимость поездки'),
                        subtitle: Text('${snap.data.totalPrice} ₽', style: TextStyle(fontSize: 15.0),),
                        trailing: FloatingActionButton(
                          onPressed: () {
                          },
                          child: Icon(Icons.keyboard_arrow_right),
                        ),
                      ),
                    );
                  } else {
                    return Center(child: Text("Высчитвается стомость поездки..."),);
                  }
                }
              ),
            ],
          ) : Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    );
  }
}
