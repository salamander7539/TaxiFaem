class GetTariff {
  GetTariff({
    this.name,
    this.totalPrice,
    this.tariffCalcType,
    this.orderTripTime,
    this.orderCompleateDist,
    this.orderStartTime,
    this.minPaymentWithTime,
    this.currency,
    this.paymentType,
    this.maxBonusPayment,
    this.bonusPayment,
    this.items,
    this.waitingBoarding,
    this.waitingPoint,
    this.timeTaximeter,
    this.waitingPrice,
  });

  final String name;
  final int totalPrice;
  final String tariffCalcType;
  final int orderTripTime;
  final int orderCompleateDist;
  final int orderStartTime;
  final int minPaymentWithTime;
  final String currency;
  final String paymentType;
  final int maxBonusPayment;
  final int bonusPayment;
  final List<Item> items;
  final Map<String, int> waitingBoarding;
  final Map<String, int> waitingPoint;
  final dynamic timeTaximeter;
  final int waitingPrice;

  factory GetTariff.fromJson(Map<String, dynamic> json) => GetTariff(
    name: json["name"] == null ? null : json["name"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    tariffCalcType: json["tariff_calc_type"] == null ? null : json["tariff_calc_type"],
    orderTripTime: json["order_trip_time"] == null ? null : json["order_trip_time"],
    orderCompleateDist: json["order_compleate_dist"] == null ? null : json["order_compleate_dist"],
    orderStartTime: json["order_start_time"] == null ? null : json["order_start_time"],
    minPaymentWithTime: json["min_payment_with_time"] == null ? null : json["min_payment_with_time"],
    currency: json["currency"] == null ? null : json["currency"],
    paymentType: json["payment_type"] == null ? null : json["payment_type"],
    maxBonusPayment: json["max_bonus_payment"] == null ? null : json["max_bonus_payment"],
    bonusPayment: json["bonus_payment"] == null ? null : json["bonus_payment"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    waitingBoarding: json["waiting_boarding"] == null ? null : Map.from(json["waiting_boarding"]).map((k, v) => MapEntry<String, int>(k, v)),
    waitingPoint: json["waiting_point"] == null ? null : Map.from(json["waiting_point"]).map((k, v) => MapEntry<String, int>(k, v)),
    timeTaximeter: json["time_taximeter"],
    waitingPrice: json["waiting_price"] == null ? null : json["waiting_price"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "total_price": totalPrice == null ? null : totalPrice,
    "tariff_calc_type": tariffCalcType == null ? null : tariffCalcType,
    "order_trip_time": orderTripTime == null ? null : orderTripTime,
    "order_compleate_dist": orderCompleateDist == null ? null : orderCompleateDist,
    "order_start_time": orderStartTime == null ? null : orderStartTime,
    "min_payment_with_time": minPaymentWithTime == null ? null : minPaymentWithTime,
    "currency": currency == null ? null : currency,
    "payment_type": paymentType == null ? null : paymentType,
    "max_bonus_payment": maxBonusPayment == null ? null : maxBonusPayment,
    "bonus_payment": bonusPayment == null ? null : bonusPayment,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "waiting_boarding": waitingBoarding == null ? null : Map.from(waitingBoarding).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "waiting_point": waitingPoint == null ? null : Map.from(waitingPoint).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "time_taximeter": timeTaximeter,
    "waiting_price": waitingPrice == null ? null : waitingPrice,
  };
}

class Item {
  Item({
    this.name,
    this.price,
  });

  final String name;
  final int price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "price": price == null ? null : price,
  };
}
