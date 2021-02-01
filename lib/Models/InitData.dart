// To parse this JSON data, do
//
//     final initData = initDataFromJson(jsonString);

class InitData {
  InitData({
    this.clientUuid,
    this.clientPhone,
    this.connection,
    this.orderStatesConsumer,
    this.ordersData,
  });

  final String clientUuid;
  final String clientPhone;
  final String connection;
  final OrderStatesConsumer orderStatesConsumer;
  final List<OrdersDatum> ordersData;

  factory InitData.fromJson(Map<String, dynamic> json) => InitData(
    clientUuid: json["client_uuid"] == null ? null : json["client_uuid"],
    clientPhone: json["client_phone"] == null ? null : json["client_phone"],
    connection: json["connection"] == null ? null : json["connection"],
    orderStatesConsumer: json["order_states_consumer"] == null ? null : OrderStatesConsumer.fromJson(json["order_states_consumer"]),
    ordersData: json["orders_data"] == null ? null : List<OrdersDatum>.from(json["orders_data"].map((x) => OrdersDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "client_uuid": clientUuid == null ? null : clientUuid,
    "connection": connection == null ? null : connection,
    "order_states_consumer": orderStatesConsumer == null ? null : orderStatesConsumer.toJson(),
    "orders_data": ordersData == null ? null : List<dynamic>.from(ordersData.map((x) => x.toJson())),
  };
}

class OrderStatesConsumer {
  OrderStatesConsumer({
    this.queue,
    this.consumer,
    this.autoAck,
    this.exclusive,
    this.noLocal,
    this.noWait,
    this.args,
  });

  final String queue;
  final String consumer;
  final bool autoAck;
  final bool exclusive;
  final bool noLocal;
  final bool noWait;
  final String args;

  factory OrderStatesConsumer.fromJson(Map<String, dynamic> json) => OrderStatesConsumer(
    queue: json["queue"] == null ? null : json["queue"],
    consumer: json["consumer"] == null ? null : json["consumer"],
    autoAck: json["auto_ack"] == null ? null : json["auto_ack"],
    exclusive: json["exclusive"] == null ? null : json["exclusive"],
    noLocal: json["no_local"] == null ? null : json["no_local"],
    noWait: json["no_wait"] == null ? null : json["no_wait"],
    args: json["args"] == null ? null : json["args"],
  );

  Map<String, dynamic> toJson() => {
    "queue": queue == null ? null : queue,
    "consumer": consumer == null ? null : consumer,
    "auto_ack": autoAck == null ? null : autoAck,
    "exclusive": exclusive == null ? null : exclusive,
    "no_local": noLocal == null ? null : noLocal,
    "no_wait": noWait == null ? null : noWait,
    "args": args == null ? null : args,
  };
}

class OrdersDatum {
  OrdersDatum({
    this.uuid,
    this.comment,
    this.routes,
    this.features,
    this.tariff,
    this.service,
    this.driver,
    this.owner,
    this.client,
    this.orderStart,
    this.cancelTime,
    this.id,
    this.clientUuid,
    this.serviceUuid,
    this.callbackPhone,
    this.featuresUuids,
    this.createdAt,
    this.updatedAt,
    this.stateName,
    this.stateTitle,
  });

  final String uuid;
  final String comment;
  final List<Route> routes;
  final dynamic features;
  final OrdersDatumTariff tariff;
  final Service service;
  final Driver driver;
  final Owner owner;
  final Client client;
  final DateTime orderStart;
  final DateTime cancelTime;
  final int id;
  final String clientUuid;
  final String serviceUuid;
  final String callbackPhone;
  final dynamic featuresUuids;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String stateName;
  final String stateTitle;

  factory OrdersDatum.fromJson(Map<String, dynamic> json) => OrdersDatum(
    uuid: json["uuid"] == null ? null : json["uuid"],
    comment: json["comment"] == null ? null : json["comment"],
    routes: json["routes"] == null ? null : List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
    features: json["features"],
    tariff: json["tariff"] == null ? null : OrdersDatumTariff.fromJson(json["tariff"]),
    service: json["service"] == null ? null : Service.fromJson(json["service"]),
    driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
    owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
    client: json["client"] == null ? null : Client.fromJson(json["client"]),
    orderStart: json["order_start"] == null ? null : DateTime.parse(json["order_start"]),
    cancelTime: json["cancel_time"] == null ? null : DateTime.parse(json["cancel_time"]),
    id: json["id"] == null ? null : json["id"],
    clientUuid: json["client_uuid"] == null ? null : json["client_uuid"],
    serviceUuid: json["service_uuid"] == null ? null : json["service_uuid"],
    callbackPhone: json["callback_phone"] == null ? null : json["callback_phone"],
    featuresUuids: json["features_uuids"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    stateName: json["state_name"] == null ? null : json["state_name"],
    stateTitle: json["state_title"] == null ? null : json["state_title"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid == null ? null : uuid,
    "comment": comment == null ? null : comment,
    "routes": routes == null ? null : List<dynamic>.from(routes.map((x) => x.toJson())),
    "features": features,
    "tariff": tariff == null ? null : tariff.toJson(),
    "service": service == null ? null : service.toJson(),
    "driver": driver == null ? null : driver.toJson(),
    "owner": owner == null ? null : owner.toJson(),
    "client": client == null ? null : client.toJson(),
    "order_start": orderStart == null ? null : orderStart.toIso8601String(),
    "cancel_time": cancelTime == null ? null : cancelTime.toIso8601String(),
    "id": id == null ? null : id,
    "client_uuid": clientUuid == null ? null : clientUuid,
    "service_uuid": serviceUuid == null ? null : serviceUuid,
    "callback_phone": callbackPhone == null ? null : callbackPhone,
    "features_uuids": featuresUuids,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "state_name": stateName == null ? null : stateName,
    "state_title": stateTitle == null ? null : stateTitle,
  };
}

class Client {
  Client({
    this.uuid,
    this.name,
    this.karma,
    this.mainPhone,
    this.phones,
    this.comment,
  });

  final String uuid;
  final String name;
  final int karma;
  final String mainPhone;
  final dynamic phones;
  final String comment;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    uuid: json["uuid"] == null ? null : json["uuid"],
    name: json["name"] == null ? null : json["name"],
    karma: json["karma"] == null ? null : json["karma"],
    mainPhone: json["main_phone"] == null ? null : json["main_phone"],
    phones: json["phones"],
    comment: json["comment"] == null ? null : json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid == null ? null : uuid,
    "name": name == null ? null : name,
    "karma": karma == null ? null : karma,
    "main_phone": mainPhone == null ? null : mainPhone,
    "phones": phones,
    "comment": comment == null ? null : comment,
  };
}

class Driver {
  Driver({
    this.uuid,
    this.name,
    this.phone,
    this.comment,
    this.stateName,
    this.car,
    this.karma,
    this.color,
    this.tariff,
    this.tag,
    this.availableServices,
    this.availableFeatures,
    this.alias,
    this.regNumber,
  });

  final String uuid;
  final String name;
  final String phone;
  final String comment;
  final String stateName;
  final String car;
  final int karma;
  final String color;
  final DriverTariff tariff;
  final dynamic tag;
  final dynamic availableServices;
  final dynamic availableFeatures;
  var alias;
  final String regNumber;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    uuid: json["uuid"] == null ? null : json["uuid"],
    name: json["name"] == null ? null : json["name"],
    phone: json["phone"] == null ? null : json["phone"],
    comment: json["comment"] == null ? null : json["comment"],
    stateName: json["state_name"] == null ? null : json["state_name"],
    car: json["car"] == null ? null : json["car"],
    karma: json["karma"] == null ? null : json["karma"],
    color: json["color"] == null ? null : json["color"],
    tariff: json["tariff"] == null ? null : DriverTariff.fromJson(json["tariff"]),
    tag: json["tag"],
    availableServices: json["available_services"],
    availableFeatures: json["available_features"],
    alias: json["alias"] == null ? null : json["alias"],
    regNumber: json["reg_number"] == null ? null : json["reg_number"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid == null ? null : uuid,
    "name": name == null ? null : name,
    "phone": phone == null ? null : phone,
    "comment": comment == null ? null : comment,
    "state_name": stateName == null ? null : stateName,
    "car": car == null ? null : car,
    "karma": karma == null ? null : karma,
    "color": color == null ? null : color,
    "tariff": tariff == null ? null : tariff.toJson(),
    "tag": tag,
    "available_services": availableServices,
    "available_features": availableFeatures,
    "alias": alias == null ? null : alias,
    "reg_number": regNumber == null ? null : regNumber,
  };
}

class DriverTariff {
  DriverTariff({
    this.uuid,
    this.tariffDefault,
    this.name,
    this.rejExp,
    this.commExp,
    this.comment,
  });

  final String uuid;
  final bool tariffDefault;
  final String name;
  final String rejExp;
  final String commExp;
  final String comment;

  factory DriverTariff.fromJson(Map<String, dynamic> json) => DriverTariff(
    uuid: json["uuid"] == null ? null : json["uuid"],
    tariffDefault: json["default"] == null ? null : json["default"],
    name: json["name"] == null ? null : json["name"],
    rejExp: json["rej_exp"] == null ? null : json["rej_exp"],
    commExp: json["comm_exp"] == null ? null : json["comm_exp"],
    comment: json["comment"] == null ? null : json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid == null ? null : uuid,
    "default": tariffDefault == null ? null : tariffDefault,
    "name": name == null ? null : name,
    "rej_exp": rejExp == null ? null : rejExp,
    "comm_exp": commExp == null ? null : commExp,
    "comment": comment == null ? null : comment,
  };
}

class Owner {
  Owner({
    this.uuid,
    this.name,
    this.comment,
  });

  final String uuid;
  final String name;
  final String comment;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    uuid: json["uuid"] == null ? null : json["uuid"],
    name: json["name"] == null ? null : json["name"],
    comment: json["comment"] == null ? null : json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid == null ? null : uuid,
    "name": name == null ? null : name,
    "comment": comment == null ? null : comment,
  };
}

class Route {
  Route({
    this.unrestrictedValue,
    this.value,
    this.country,
    this.region,
    this.regionType,
    this.city,
    this.cityType,
    this.street,
    this.streetType,
    this.streetWithType,
    this.house,
    this.outOfTown,
    this.houseType,
    this.accuracyLevel,
    this.radius,
    this.lat,
    this.lon,
  });

  final String unrestrictedValue;
  final String value;
  final String country;
  final String region;
  final String regionType;
  final String city;
  final String cityType;
  final String street;
  final String streetType;
  final String streetWithType;
  final String house;
  final bool outOfTown;
  final String houseType;
  final int accuracyLevel;
  final int radius;
  final double lat;
  final double lon;

  factory Route.fromJson(Map<String, dynamic> json) => Route(
    unrestrictedValue: json["unrestricted_value"] == null ? null : json["unrestricted_value"],
    value: json["value"] == null ? null : json["value"],
    country: json["country"] == null ? null : json["country"],
    region: json["region"] == null ? null : json["region"],
    regionType: json["region_type"] == null ? null : json["region_type"],
    city: json["city"] == null ? null : json["city"],
    cityType: json["city_type"] == null ? null : json["city_type"],
    street: json["street"] == null ? null : json["street"],
    streetType: json["street_type"] == null ? null : json["street_type"],
    streetWithType: json["street_with_type"] == null ? null : json["street_with_type"],
    house: json["house"] == null ? null : json["house"],
    outOfTown: json["out_of_town"] == null ? null : json["out_of_town"],
    houseType: json["house_type"] == null ? null : json["house_type"],
    accuracyLevel: json["accuracy_level"] == null ? null : json["accuracy_level"],
    radius: json["radius"] == null ? null : json["radius"],
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lon: json["lon"] == null ? null : json["lon"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "unrestricted_value": unrestrictedValue == null ? null : unrestrictedValue,
    "value": value == null ? null : value,
    "country": country == null ? null : country,
    "region": region == null ? null : region,
    "region_type": regionType == null ? null : regionType,
    "city": city == null ? null : city,
    "city_type": cityType == null ? null : cityType,
    "street": street == null ? null : street,
    "street_type": streetType == null ? null : streetType,
    "street_with_type": streetWithType == null ? null : streetWithType,
    "house": house == null ? null : house,
    "out_of_town": outOfTown == null ? null : outOfTown,
    "house_type": houseType == null ? null : houseType,
    "accuracy_level": accuracyLevel == null ? null : accuracyLevel,
    "radius": radius == null ? null : radius,
    "lat": lat == null ? null : lat,
    "lon": lon == null ? null : lon,
  };
}

class Service {
  Service({
    this.uuid,
    this.name,
    this.priceCoefficient,
    this.freight,
    this.comment,
    this.tag,
  });

  final String uuid;
  final String name;
  final double priceCoefficient;
  final bool freight;
  final String comment;
  final List<String> tag;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    uuid: json["uuid"] == null ? null : json["uuid"],
    name: json["name"] == null ? null : json["name"],
    priceCoefficient: json["price_coefficient"] == null ? null : json["price_coefficient"].toDouble(),
    freight: json["freight"] == null ? null : json["freight"],
    comment: json["comment"] == null ? null : json["comment"],
    tag: json["tag"] == null ? null : List<String>.from(json["tag"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid == null ? null : uuid,
    "name": name == null ? null : name,
    "price_coefficient": priceCoefficient == null ? null : priceCoefficient,
    "freight": freight == null ? null : freight,
    "comment": comment == null ? null : comment,
    "tag": tag == null ? null : List<dynamic>.from(tag.map((x) => x)),
  };
}

class OrdersDatumTariff {
  OrdersDatumTariff({
    this.name,
    this.totalPrice,
    this.currency,
    this.paymentType,
    this.items,
  });

  final String name;
  final int totalPrice;
  final String currency;
  final String paymentType;
  final dynamic items;

  factory OrdersDatumTariff.fromJson(Map<String, dynamic> json) => OrdersDatumTariff(
    name: json["name"] == null ? null : json["name"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    currency: json["currency"] == null ? null : json["currency"],
    paymentType: json["payment_type"] == null ? null : json["payment_type"],
    items: json["items"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "total_price": totalPrice == null ? null : totalPrice,
    "currency": currency == null ? null : currency,
    "payment_type": paymentType == null ? null : paymentType,
    "items": items,
  };
}
