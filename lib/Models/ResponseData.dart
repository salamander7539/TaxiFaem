import 'package:flutter_faem_app/Models/InitialAddressModel.dart';

class DeliveryResponseData {
  List<Records> records;
  int records_count;

  DeliveryResponseData( {
    this.records,
    this.records_count,
  });

  factory DeliveryResponseData.fromJson(Map<String, dynamic> parsedJson){

    var records_list = parsedJson['records'] as List;
    print(records_list.runtimeType);
    List<Records> recordList = null;
    if(records_list != null){
      recordList = records_list.map((i) => Records.fromJson(i)).toList();
    }

    return DeliveryResponseData(
        records:recordList,
        records_count:parsedJson['records_count']
    );
  }
}

class Records{
  String uuid;
  String name;
  String phone;
  String comment;
  bool own_delivery;
  String image;
  bool available;
  List<WorkSchedule> work_schedule;
  String type;
  List<String> product_category;
  List<DestinationPoints> destination_points;
  List<String> destination_points_uuid;
  int order_preparation_time_second;
  int created_at_unix;

  Records( {
    this.uuid,
    this.name,
    this.phone,
    this.comment,
    this.own_delivery,
    this.image,
    this.available,
    this.work_schedule,
    this.type,
    this.product_category,
    this.destination_points,
    this.destination_points_uuid,
    this.order_preparation_time_second,
    this.created_at_unix,
  });

  Map<String, dynamic> toJson(){
    List<dynamic> dp;
    if(destination_points != null && destination_points.length > 0) {
      dp = new List<dynamic>();
//      dp.add(destination_points[0].toJson());
      destination_points.forEach((element) {
        dp.add(
            element.toJson()
        );
      });
    }

    List<dynamic> ws;
    if(work_schedule != null && work_schedule.length > 0) {
      ws = new List<dynamic>();
//      dp.add(destination_points[0].toJson());
      work_schedule.forEach((element) {
        ws.add(
            element.toJson()
        );
      });
    }

    return
      {
        'uuid': this.uuid,
        'name': this.name,
        'phone': this.phone,
        'comment': this.comment,
        'own_delivery': this.own_delivery,
        'image': this.image,
        'available': this.available,
        'work_schedule': ws,
        'type': this.type,
        'product_category': this.product_category,
        'destination_points': dp,
        'destination_points_uuid': null,
        'order_preparation_time_second': this.order_preparation_time_second,
        'created_at_unix': this.created_at_unix,
      };
  }

  factory Records.fromJson(Map<String, dynamic> parsedJson){

    var work_schedule_list = parsedJson['work_schedule'] as List;
    List<WorkSchedule> workScheduleList = null;
    if(work_schedule_list != null){
      workScheduleList = work_schedule_list.map((i) =>
          WorkSchedule.fromJson(i)).toList();
    }

    var destination_points_list = parsedJson['destination_points'] as List;
    List<DestinationPoints> destinationPointsList = null;
    if(destination_points_list != null){
      destinationPointsList = destination_points_list.map((i) =>
          DestinationPoints.fromJson(i)).toList();
    }

    var product_category_list = parsedJson['product_category'] as List;
    List<String> productCategoryList = new List<String>();
    if(product_category_list !=null) {
      product_category_list.forEach((element) {
        productCategoryList.add(element as String);
      });
    }

    var destination_points_uuid_list = parsedJson['destination_points_uuid'] as List;
    List<String> destinationPointsUuidList = new List<String>();
    if(destination_points_uuid_list != null){
      destination_points_uuid_list.forEach((element) {
        destinationPointsUuidList.add(element as String);
      });
    }

    return Records(
      uuid: parsedJson['uuid'],
      name: parsedJson['name'],
      phone: parsedJson['phone'],
      comment: parsedJson['comment'],
      own_delivery: parsedJson['own_delivery'],
      image: parsedJson['image'],
      work_schedule: workScheduleList,
      type: parsedJson['type'],
      product_category: productCategoryList,
      available: parsedJson['available'],
      destination_points: destinationPointsList,
      destination_points_uuid: destinationPointsUuidList,
      order_preparation_time_second: parsedJson['order_preparation_time_second'],
      created_at_unix: parsedJson['created_at_unix'],
    );
  }

  String getCategoriesString(){
    String result = '';
    product_category.forEach((element) {
      result += element + ', ';
    });
    if(result == ''){
      return result;
    }
    return result.substring(0, result.length - 3);
  }
}

class WorkSchedule{
  int week_day;
  bool day_off;
  int work_beginning;
  int work_ending;

  WorkSchedule( {
    this.week_day,
    this.day_off,
    this.work_beginning,
    this.work_ending,
  });

  Map<String, dynamic> toJson(){
    return
      {
        'week_day': this.week_day,
        'day_off': this.day_off,
        'work_beginning': this.work_beginning,
        'work_ending': this.work_ending,
      };
  }

  factory WorkSchedule.fromJson(Map<String, dynamic> parsedJson){
    return WorkSchedule(
      week_day:parsedJson['week_day'],
      day_off:parsedJson['day_off'],
      work_beginning:parsedJson['work_beginning'],
      work_ending:parsedJson['work_ending'],
    );
  }
}


class DestinationPoints extends InitialAddressModel{
  String uuid;
  String point_type;
  String type;
  String category;
  int front_door;
  String house_type;
  int accuracy_level;
  num min;
  DestinationPoints( {
    this.uuid,
    this.point_type,
    this.type,
    this.category,
    this.front_door,
    String unrestrictedValue,
    String value,
    String country,
    String region,
    String regionType,
    String city,
    String cityType,
    String street,
    String streetType,
    String streetWithType,
    String house,
    bool outOfTown,
    String houseType,
    int accuracyLevel,
    int radius,
    double lat,
    double lon,
    String comment
  }):super(
      unrestrictedValue: unrestrictedValue,
      value: value,
      country: country,
      region: region,
      regionType: regionType,
      city: city,
      cityType: cityType,
      street: street,
      streetType: streetType,
      streetWithType: streetWithType,
      house: house,
      outOfTown: outOfTown,
      houseType: houseType,
      accuracyLevel: accuracyLevel,
      radius: radius,
      lat: lat,
      lon: lon,
      comment: comment
  );

  factory DestinationPoints.fromJson(Map<String, dynamic> parsedJson){

    return DestinationPoints(
      uuid:parsedJson['uuid'],
      point_type:parsedJson['point_type'],
      unrestrictedValue:parsedJson['unrestricted_value'],
      value:parsedJson['value'],
      country:parsedJson['country'],
      region:parsedJson['region'],
      regionType:parsedJson['region_type'],
      type:parsedJson['type'],
      city:parsedJson['city'],
      category:parsedJson['category'],
      cityType:parsedJson['city_type'],
      street:parsedJson['street'],
      streetType:parsedJson['street_type'],
      streetWithType:parsedJson['street_with_type'],
      house:parsedJson['house'],
      front_door:parsedJson['front_door'],
      comment:parsedJson['comment'],
      outOfTown:parsedJson['out_of_town'],
      houseType:parsedJson['house_type'],
      accuracyLevel:parsedJson['accuracy_level'],
      radius:parsedJson['radius'],
      lat:parsedJson['lat'],
      lon:parsedJson['lon'],
    );
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> temp = new Map<String, dynamic>();
    temp = {
      'uuid': uuid,
      'point_type':point_type,
      'unrestricted_value':unrestrictedValue,
      'value':value,
      'country':country,
      'region':region,
      'region_type':regionType,
      'type':type,
      'city':city,
      'category':category,
      'city_type':cityType,
      'street':street,
      'street_type':streetType,
      'street_with_type':streetWithType,
      'house':house,
      'front_door':front_door,
      'comment':comment,
      'out_of_town':outOfTown,
      'house_type':house_type,
      'accuracy_level':accuracy_level,
      'radius':radius,
      'lat':lat,
      'lon':lon,
    };
    return temp;
  }
}