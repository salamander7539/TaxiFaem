class GetAllTariff {
  GetAllTariff({
    this.serviceUuid,
    this.serviceImage,
    this.serviceImagesSet,
    this.productDelivery,
    this.productsPrice,
    this.name,
    this.currency,
    this.bonusPayment,
    this.maxBonusPayment,
    this.totalPrice,
    this.surge,
    this.precalculated,
  });

  final String serviceUuid;
  final String serviceImage;
  final ServiceImagesSet serviceImagesSet;
  final bool productDelivery;
  final int productsPrice;
  final String name;
  final String currency;
  final int bonusPayment;
  final int maxBonusPayment;
  final int totalPrice;
  final Surge surge;
  final String precalculated;

  factory GetAllTariff.fromJson(Map<String, dynamic> json) => GetAllTariff(
    serviceUuid: json["service_uuid"] == null ? null : json["service_uuid"],
    serviceImage: json["service_image"] == null ? null : json["service_image"],
    serviceImagesSet: json["service_images_set"] == null ? null : ServiceImagesSet.fromJson(json["service_images_set"]),
    productDelivery: json["product_delivery"] == null ? null : json["product_delivery"],
    productsPrice: json["products_price"] == null ? null : json["products_price"],
    name: json["name"] == null ? null : json["name"],
    currency: json["currency"] == null ? null : json["currency"],
    bonusPayment: json["bonus_payment"] == null ? null : json["bonus_payment"],
    maxBonusPayment: json["max_bonus_payment"] == null ? null : json["max_bonus_payment"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    surge: json["surge"] == null ? null : Surge.fromJson(json["surge"]),
    precalculated: json["precalculated"] == null ? null : json["precalculated"],
  );

  Map<String, dynamic> toJson() => {
    "service_uuid": serviceUuid == null ? null : serviceUuid,
    "service_image": serviceImage == null ? null : serviceImage,
    "service_images_set": serviceImagesSet == null ? null : serviceImagesSet.toJson(),
    "product_delivery": productDelivery == null ? null : productDelivery,
    "products_price": productsPrice == null ? null : productsPrice,
    "name": name == null ? null : name,
    "currency": currency == null ? null : currency,
    "bonus_payment": bonusPayment == null ? null : bonusPayment,
    "max_bonus_payment": maxBonusPayment == null ? null : maxBonusPayment,
    "total_price": totalPrice == null ? null : totalPrice,
    "surge": surge == null ? null : surge.toJson(),
    "precalculated": precalculated == null ? null : precalculated,
  };
}

class ServiceImagesSet {
  ServiceImagesSet({
    this.fullFormat,
    this.smallFormat,
    this.mediumFormat,
  });

  final String fullFormat;
  final String smallFormat;
  final String mediumFormat;

  factory ServiceImagesSet.fromJson(Map<String, dynamic> json) => ServiceImagesSet(
    fullFormat: json["full_format"] == null ? null : json["full_format"],
    smallFormat: json["small_format"] == null ? null : json["small_format"],
    mediumFormat: json["medium_format"] == null ? null : json["medium_format"],
  );

  Map<String, dynamic> toJson() => {
    "full_format": fullFormat == null ? null : fullFormat,
    "small_format": smallFormat == null ? null : smallFormat,
    "medium_format": mediumFormat == null ? null : mediumFormat,
  };
}

class Surge {
  Surge({
    this.delta,
    this.surge,
    this.surgeCrm,
    this.surgeType,
    this.maxPriceDelta,
    this.curDelta,
    this.curOrderCount,
    this.curDriverCount,
    this.isFlat,
  });

  final int delta;
  final int surge;
  final int surgeCrm;
  final String surgeType;
  final int maxPriceDelta;
  final int curDelta;
  final int curOrderCount;
  final int curDriverCount;
  final bool isFlat;

  factory Surge.fromJson(Map<String, dynamic> json) => Surge(
    delta: json["delta"] == null ? null : json["delta"],
    surge: json["surge"] == null ? null : json["surge"],
    surgeCrm: json["surge_crm"] == null ? null : json["surge_crm"],
    surgeType: json["surge_type"] == null ? null : json["surge_type"],
    maxPriceDelta: json["max_price_delta"] == null ? null : json["max_price_delta"],
    curDelta: json["_cur_delta"] == null ? null : json["_cur_delta"],
    curOrderCount: json["_cur_order_count"] == null ? null : json["_cur_order_count"],
    curDriverCount: json["_cur_driver_count"] == null ? null : json["_cur_driver_count"],
    isFlat: json["_is_flat"] == null ? null : json["_is_flat"],
  );

  Map<String, dynamic> toJson() => {
    "delta": delta == null ? null : delta,
    "surge": surge == null ? null : surge,
    "surge_crm": surgeCrm == null ? null : surgeCrm,
    "surge_type": surgeType == null ? null : surgeType,
    "max_price_delta": maxPriceDelta == null ? null : maxPriceDelta,
    "_cur_delta": curDelta == null ? null : curDelta,
    "_cur_order_count": curOrderCount == null ? null : curOrderCount,
    "_cur_driver_count": curDriverCount == null ? null : curDriverCount,
    "_is_flat": isFlat == null ? null : isFlat,
  };
}
