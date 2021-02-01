// To parse this JSON data, do
//
//     final getOptions = getOptionsFromJson(jsonString);

import 'dart:convert';

GetOptions getOptionsFromJson(String str) => new GetOptions.fromJson(json.decode(str));

class GetOptions {
  GetOptions({
    this.features,
    this.services,
    this.reasonsForCancel,
  });

  List<Feature> features;
  List<Service> services;
  List<ReasonsForCancel> reasonsForCancel;

  factory GetOptions.fromJson(Map<String, dynamic> json) => GetOptions(
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
    reasonsForCancel: List<ReasonsForCancel>.from(json["reasons_for_cancel"].map((x) => ReasonsForCancel.fromJson(x))),
  );

}

class Feature {
  Feature({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.uuid,
    this.name,
    this.comment,
    this.price,
    this.tag,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String uuid;
  String name;
  String comment;
  int price;
  List<String> tag;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    id: json["id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    uuid: json["uuid"],
    name: json["name"],
    comment: json["comment"],
    price: json["price"] == null ? null : json["price"],
    tag: json["tag"] == null ? null : List<String>.from(json["tag"].map((x) => x)),
  );
  @override
  String toString() {
    return '$name';
  }
}

class Service {
  Service({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.uuid,
    this.name,
    this.priceCoefficient,
    this.freight,
    this.comment,
    this.tag,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String uuid;
  String name;
  double priceCoefficient;
  bool freight;
  String comment;
  List<String> tag;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    uuid: json["uuid"],
    name: json["name"],
    priceCoefficient: json["price_coefficient"].toDouble(),
    freight: json["freight"],
    comment: json["comment"],
    tag: List<String>.from(json["tag"].map((x) => x)),
  );
  @override
  String toString() {
    return '$name';
  }
}

class ReasonsForCancel {
  ReasonsForCancel({
    this.reasonName,
    this.reasonTitle,
  });

  String reasonName;
  String reasonTitle;

  factory ReasonsForCancel.fromJson(Map<String, dynamic> json) => ReasonsForCancel(
    reasonName: json["reason_name"],
    reasonTitle: json["reason_title"],
  );

  @override
  String toString() {
    return '$reasonName';
  }
}
