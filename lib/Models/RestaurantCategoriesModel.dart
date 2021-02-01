import 'dart:convert';

RestaurantCategories restaurantCategoriesFromJson(String str) => RestaurantCategories.fromJson(json.decode(str));

String restaurantCategoriesToJson(RestaurantCategories data) => json.encode(data.toJson());

class RestaurantCategories {
  RestaurantCategories({
    this.records,
    this.recordsCount,
  });

  List<Record> records;
  int recordsCount;

  factory RestaurantCategories.fromJson(Map<String, dynamic> json) => RestaurantCategories(
    records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
    recordsCount: json["records_count"],
  );

  Map<String, dynamic> toJson() => {
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
    "records_count": recordsCount,
  };
}

class Record {
  Record({
    this.uuid,
    this.name,
    this.url,
    this.priority,
    this.description,
    this.deleted,
    this.createdAt,
  });

  String uuid;
  String name;
  String url;
  int priority;
  String description;
  bool deleted;
  DateTime createdAt;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    uuid: json["uuid"],
    name: json["name"],
    url: json["url"],
    priority: json["priority"],
    description: json["description"],
    deleted: json["deleted"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "name": name,
    "url": url,
    "priority": priority,
    "description": description,
    "deleted": deleted,
    "created_at": createdAt.toIso8601String(),
  };
}