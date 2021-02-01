import 'package:flutter_faem_app/Get/get_services.dart';
import 'package:flutter_faem_app/Models/BuildRouteModel.dart';
import 'package:flutter_faem_app/Models/FindAddressModel.dart';
import 'package:flutter_faem_app/Models/Options.dart';
import 'package:flutter_faem_app/Post/build_route_way.dart';
import 'package:flutter_faem_app/Post/find_special_address.dart';
import 'package:flutter_faem_app/Screens/make_order_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class CreateOrder extends StatefulWidget {
  @override
  _CreateOrderState createState() => _CreateOrderState();
}

List<Service> serviceItem = [];
var routeCoordinates;
BuildRouteWay routeLine;

var addressResponse,
    destinationResponse,
    transferAddressData,
    transferDestinationData;

var addUnrestricted_value,
    addValue,
    addCountry,
    addRegion,
    addRegion_type,
    addCity,
    addCity_type,
    addStreet,
    addStreet_type,
    addStreet_with_type,
    addHouse,
    addOut_of_town,
    addHouse_type,
    addAccuracy_level,
    addRadius,
    addLat,
    addLon;

var destUnrestricted_value,
    destValue,
    destCountry,
    destRegion,
    destRegion_type,
    destCity,
    destCity_type,
    destStreet,
    destStreet_type,
    destStreet_with_type,
    destHouse,
    destOut_of_town,
    destHouse_type,
    destAccuracy_level,
    destRadius,
    destLat,
    destLon;

var findAddressController = TextEditingController();

class _CreateOrderState extends State<CreateOrder> {
  int _currentIndex;
  static List<AddressData> addresses = new List<AddressData>();

  FocusNode addressFocusNode;
  FocusNode destinationFocusNode;
  FocusNode commentFocusNode;

  List<Feature> featureItem = []; //Опции
  List<String> chosenService = [];

  String myAddress, destinationMark;

  AutoCompleteTextField generalSearchTextField;
  AutoCompleteTextField searchTextField;
  AutoCompleteTextField searchTextField1;

  GlobalKey<AutoCompleteTextFieldState<AddressData>> generalKey =
      new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<AddressData>> key = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<AddressData>> key1 = new GlobalKey();
  TextEditingController _controller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool visible = false;
  bool loading = true;
  bool bottomVisible = true;
  bool optionsLoading = true;
  bool _isVisible = false;
  bool active = true;
  bool toggleActive = false;
  bool checkBoxValue = false;

  double sliderValue = 10.0;
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";

  _openMakeOrder(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => FractionallySizedBox(
        heightFactor: 1.0,
        child: MakeOrder(),
      ),
    );
  }

  void getAddresses(String name) async {
    try {
      var url = "https://crm.apis.stage.faem.pro/api/v2/addresses";
      var jsonBody = json.encode({"name": name});
      final response =
          await http.post(url, body: jsonBody, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if (response.statusCode == 200) {
        addresses = loadAddresses(response.body);
        var jsonResponse = json.decode(response.body);
        transferAddressData = jsonResponse[0];
        var add = new AddressData.fromJson(transferAddressData);
        print("Addresses: ${addresses.length}");
        setState(() {
          loading = false;
        });
        if (key.currentState != null) {
          key.currentState.suggestions = addresses;
          key.currentState.setState(() {});
        }
        print(loading);
      } else {
        print("Error with code ${response.statusCode}");
      }
    } catch (e) {
      print("Error get addresses");
    }
  }

  void getDestination(String name) async {
    try {
      var url = "https://crm.apis.stage.faem.pro/api/v2/addresses";
      var jsonBody = json.encode({"name": name});
      final response =
          await http.post(url, body: jsonBody, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if (response.statusCode == 200) {
        List tempList = new List();
        addresses = loadDestination(response.body);
        var jsonResponse = json.decode(response.body);
        transferDestinationData = jsonResponse[0];
        var dest = new AddressData.fromJson(transferDestinationData);
        print("Destinations: ${addresses.length}");
        setState(() {
          loading = false;
        });
        if (key1.currentState != null) {
          key1.currentState.suggestions = addresses;
          key1.currentState.setState(() {});
        }
        print(loading);
      } else {
        print("Error with code ${response.statusCode}");
      }
    } catch (e) {
      print("Error get addresses");
    }
  }

  static List<AddressData> loadAddresses(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed
        .map<AddressData>((json) => AddressData.fromJson(json))
        .toList();
  }

  static List<AddressData> loadDestination(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed
        .map<AddressData>((json) => AddressData.fromJson(json))
        .toList();
  }

  Widget row(AddressData addressData) {
    return Container();
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: <Widget>[
    //     Container(
    //       height: MediaQuery.of(context).size.width * 0.15,
    //       width: MediaQuery.of(context).size.width * 0.9,
    //       child: Align(
    //         alignment: Alignment.centerLeft,
    //         child: Text(
    //           addressData.unrestrictedValue,
    //           style: TextStyle(
    //             color: Color(0xFF595959),
    //             fontSize: 17.0,
    //           ),
    //           softWrap: true,
    //         ),
    //       ),
    //     ),
    //     SizedBox(
    //       width: 15.0,
    //       height: 50.0,
    //     ),
    //   ],
    // );
  }

  getServiceData() async {
    serviceItem = await getServices();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = null;
    getServiceData();
    destinationFocusNode = FocusNode();
    destinationFocusNode.requestFocus();
  }

  void dispose() {
    // Clean up the focus node when the Form is disposed.
    destinationFocusNode.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: ellipseSvg,
                      ),
                      Flexible(
                        flex: 7,
                        child: AutoCompleteTextField<AddressData>(
                          controller: _controller,
                          key: key1,
                          textChanged: (String value) {
                            if (value.length > 0) {
                              getDestination(value);
                            }
                          },
                          focusNode: destinationFocusNode,
                          clearOnSubmit: false,
                          suggestions: addresses,
                          style: TextStyle(
                            color: Color(0xFF595959),
                            fontSize: 17.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Куда?',
                          ),
                          itemFilter: (item, query) {
                            return item.unrestrictedValue
                                .toLowerCase()
                                .startsWith(query.toLowerCase());
                          },
                          itemSorter: (a, b) {
                            return a.unrestrictedValue
                                .compareTo(b.unrestrictedValue);
                          },
                          itemBuilder: (context, item) {
                            return row(item);
                          },
                          itemSubmitted: (item) {
                            setState(() {
                              searchTextField1.textField.controller.text =
                                  item.unrestrictedValue;
                              getDestination(
                                  searchTextField1.textField.controller.text);
                            });
                            FocusScope.of(context)
                                .requestFocus(commentFocusNode);
                          },
                        ),
                        // child: TextField(
                        //   decoration: InputDecoration(
                        //     border: InputBorder.none,
                        //     focusedBorder: InputBorder.none,
                        //     enabledBorder: InputBorder.none,
                        //     errorBorder: InputBorder.none,
                        //     disabledBorder: InputBorder.none,
                        //     hintText: 'Адрес подачи',
                        //   ),
                        // ),
                      ),
                      VerticalDivider(
                        color: Color(0xFFEDEDED),
                        thickness: 1,
                        width: 1,
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: FlatButton(
                            child: Text('Карта'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  height: 400.0,
                  decoration: BoxDecoration(),
                  child: ListView.builder(
                      itemCount: addresses == null ? 0 : addresses.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0.0,
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () async {
                                  setState(() {
                                    _controller.text =
                                        addresses[index].unrestrictedValue;
                                    endPointController.text =
                                        addresses[index].unrestrictedValue;
                                  });
                                  // serviceItem = await getServices();
                                  destData = await findSpecialAddress(
                                      addresses[index].lat,
                                      addresses[index].lon);
                                  // print(destData);
//                                  routeLine = await buildRouteWay();
                                  // routeCoordinates = routeLine.routes.geometry.coordinates;
                                  Navigator.pop(context);
                                  await _openMakeOrder(context);
                                },
                                title: Text(addresses[index].unrestrictedValue),
                              ),
                              Divider(
                                height: 0.0,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                // Column(
                //   children: [
                //     ListView.builder(
                //         itemCount: 3,
                //         itemBuilder: (context, index) {
                //           return Container(
                //             height: 40.0,
                //             child: ListTile(
                //               title: Text(
                //                   'item ${index + 1}'
                //               ),
                //             ),
                //           );
                //         }),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
