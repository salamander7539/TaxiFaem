class MyOrders {
    MyOrders({
        this.uuid,
        this.comment,
        this.routes,
        this.routeWayData,
        this.features,
        this.tariff,
        this.phoneLine,
        this.fixedPrice,
        this.service,
        this.increasedFare,
        this.driver,
        this.client,
        this.source,
        this.driverRating,
        this.clientRating,
        this.isOptional,
        this.withoutDelivery,
        this.ownDelivery,
        this.orderStart,
        this.cancelTime,
        this.distributionByTaxiPark,
        this.promotion,
        this.arrivalTime,
        this.productsData,
        this.paymentType,
        this.paymentMeta,
        this.estimatedDeliveryTime,
        this.counterOrderMarker,
        this.taxiParkData,
        this.taxiParkUuid,
        this.id,
        this.clientUuid,
        this.serviceUuid,
        this.callbackPhone,
        this.featuresUuids,
        this.createdAt,
        this.createdAtUnix,
        this.updatedAt,
        this.visibility,
        this.state,
        this.stateTitle,
    });

    final String uuid;
    final String comment;
    final List<Route> routes;
    final RouteWayData routeWayData;
    final dynamic features;
    final MyOrderTariff tariff;
    final PhoneLine phoneLine;
    final int fixedPrice;
    final Service service;
    final int increasedFare;
    final Driver driver;
    final Client client;
    final String source;
    final Rating driverRating;
    final Rating clientRating;
    final bool isOptional;
    final bool withoutDelivery;
    final bool ownDelivery;
    final DateTime orderStart;
    final DateTime cancelTime;
    final dynamic distributionByTaxiPark;
    final MyOrderPromotion promotion;
    final int arrivalTime;
    final ProductsData productsData;
    final String paymentType;
    final PaymentMeta paymentMeta;
    final DateTime estimatedDeliveryTime;
    final bool counterOrderMarker;
    final TaxiParkData taxiParkData;
    final String taxiParkUuid;
    final int id;
    final String clientUuid;
    final String serviceUuid;
    final String callbackPhone;
    final dynamic featuresUuids;
    final DateTime createdAt;
    final int createdAtUnix;
    final DateTime updatedAt;
    final bool visibility;
    final String state;
    final String stateTitle;

    factory MyOrders.fromJson(Map<String, dynamic> json) => MyOrders(
        uuid: json["uuid"] == null ? null : json["uuid"],
        comment: json["comment"] == null ? null : json["comment"],
        routes: json["routes"] == null ? null : List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        routeWayData: json["route_way_data"] == null ? null : RouteWayData.fromJson(json["route_way_data"]),
        features: json["features"],
        tariff: json["tariff"] == null ? null : MyOrderTariff.fromJson(json["tariff"]),
        phoneLine: json["phone_line"] == null ? null : PhoneLine.fromJson(json["phone_line"]),
        fixedPrice: json["fixed_price"] == null ? null : json["fixed_price"],
        service: json["service"] == null ? null : Service.fromJson(json["service"]),
        increasedFare: json["increased_fare"] == null ? null : json["increased_fare"],
        driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
        client: json["client"] == null ? null : Client.fromJson(json["client"]),
        source: json["source"] == null ? null : json["source"],
        driverRating: json["driver_rating"] == null ? null : Rating.fromJson(json["driver_rating"]),
        clientRating: json["client_rating"] == null ? null : Rating.fromJson(json["client_rating"]),
        isOptional: json["is_optional"] == null ? null : json["is_optional"],
        withoutDelivery: json["without_delivery"] == null ? null : json["without_delivery"],
        ownDelivery: json["own_delivery"] == null ? null : json["own_delivery"],
        orderStart: json["order_start"] == null ? null : DateTime.parse(json["order_start"]),
        cancelTime: json["cancel_time"] == null ? null : DateTime.parse(json["cancel_time"]),
        distributionByTaxiPark: json["distribution_by_taxi_park"],
        promotion: json["promotion"] == null ? null : MyOrderPromotion.fromJson(json["promotion"]),
        arrivalTime: json["arrival_time"] == null ? null : json["arrival_time"],
        productsData: json["products_data"] == null ? null : ProductsData.fromJson(json["products_data"]),
        paymentType: json["payment_type"] == null ? null : json["payment_type"],
        paymentMeta: json["payment_meta"] == null ? null : PaymentMeta.fromJson(json["payment_meta"]),
        estimatedDeliveryTime: json["estimated_delivery_time"] == null ? null : DateTime.parse(json["estimated_delivery_time"]),
        counterOrderMarker: json["counter_order_marker"] == null ? null : json["counter_order_marker"],
        taxiParkData: json["taxi_park_data"] == null ? null : TaxiParkData.fromJson(json["taxi_park_data"]),
        taxiParkUuid: json["taxi_park_uuid"] == null ? null : json["taxi_park_uuid"],
        id: json["id"] == null ? null : json["id"],
        clientUuid: json["client_uuid"] == null ? null : json["client_uuid"],
        serviceUuid: json["service_uuid"] == null ? null : json["service_uuid"],
        callbackPhone: json["callback_phone"] == null ? null : json["callback_phone"],
        featuresUuids: json["features_uuids"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        createdAtUnix: json["created_at_unix"] == null ? null : json["created_at_unix"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        visibility: json["visibility"] == null ? null : json["visibility"],
        state: json["state"] == null ? null : json["state"],
        stateTitle: json["state_title"] == null ? null : json["state_title"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "comment": comment == null ? null : comment,
        "routes": routes == null ? null : List<dynamic>.from(routes.map((x) => x.toJson())),
        "route_way_data": routeWayData == null ? null : routeWayData.toJson(),
        "features": features,
        "tariff": tariff == null ? null : tariff.toJson(),
        "phone_line": phoneLine == null ? null : phoneLine.toJson(),
        "fixed_price": fixedPrice == null ? null : fixedPrice,
        "service": service == null ? null : service.toJson(),
        "increased_fare": increasedFare == null ? null : increasedFare,
        "driver": driver == null ? null : driver.toJson(),
        "client": client == null ? null : client.toJson(),
        "source": source == null ? null : source,
        "driver_rating": driverRating == null ? null : driverRating.toJson(),
        "client_rating": clientRating == null ? null : clientRating.toJson(),
        "is_optional": isOptional == null ? null : isOptional,
        "without_delivery": withoutDelivery == null ? null : withoutDelivery,
        "own_delivery": ownDelivery == null ? null : ownDelivery,
        "order_start": orderStart == null ? null : orderStart.toIso8601String(),
        "cancel_time": cancelTime == null ? null : cancelTime.toIso8601String(),
        "distribution_by_taxi_park": distributionByTaxiPark,
        "promotion": promotion == null ? null : promotion.toJson(),
        "arrival_time": arrivalTime == null ? null : arrivalTime,
        "products_data": productsData == null ? null : productsData.toJson(),
        "payment_type": paymentType == null ? null : paymentType,
        "payment_meta": paymentMeta == null ? null : paymentMeta.toJson(),
        "estimated_delivery_time": estimatedDeliveryTime == null ? null : estimatedDeliveryTime.toIso8601String(),
        "counter_order_marker": counterOrderMarker == null ? null : counterOrderMarker,
        "taxi_park_data": taxiParkData == null ? null : taxiParkData.toJson(),
        "taxi_park_uuid": taxiParkUuid == null ? null : taxiParkUuid,
        "id": id == null ? null : id,
        "client_uuid": clientUuid == null ? null : clientUuid,
        "service_uuid": serviceUuid == null ? null : serviceUuid,
        "callback_phone": callbackPhone == null ? null : callbackPhone,
        "features_uuids": featuresUuids,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "created_at_unix": createdAtUnix == null ? null : createdAtUnix,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "visibility": visibility == null ? null : visibility,
        "state": state == null ? null : state,
        "state_title": stateTitle == null ? null : stateTitle,
    };
}

class Client {
    Client({
        this.uuid,
        this.name,
        this.karma,
        this.mainPhone,
        this.blocked,
        this.phones,
        this.deviceId,
        this.telegramId,
        this.comment,
        this.activity,
        this.defaultPaymentType,
        this.promotion,
        this.referralProgramData,
        this.blacklist,
    });

    final String uuid;
    final String name;
    final int karma;
    final String mainPhone;
    final bool blocked;
    final dynamic phones;
    final String deviceId;
    final String telegramId;
    final String comment;
    final int activity;
    final String defaultPaymentType;
    final ClientPromotion promotion;
    final ReferralProgramData referralProgramData;
    final dynamic blacklist;

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        uuid: json["uuid"] == null ? null : json["uuid"],
        name: json["name"] == null ? null : json["name"],
        karma: json["karma"] == null ? null : json["karma"],
        mainPhone: json["main_phone"] == null ? null : json["main_phone"],
        blocked: json["blocked"] == null ? null : json["blocked"],
        phones: json["phones"],
        deviceId: json["device_id"] == null ? null : json["device_id"],
        telegramId: json["telegram_id"] == null ? null : json["telegram_id"],
        comment: json["comment"] == null ? null : json["comment"],
        activity: json["activity"] == null ? null : json["activity"],
        defaultPaymentType: json["default_payment_type"] == null ? null : json["default_payment_type"],
        promotion: json["promotion"] == null ? null : ClientPromotion.fromJson(json["promotion"]),
        referralProgramData: json["referral_program_data"] == null ? null : ReferralProgramData.fromJson(json["referral_program_data"]),
        blacklist: json["blacklist"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "name": name == null ? null : name,
        "karma": karma == null ? null : karma,
        "main_phone": mainPhone == null ? null : mainPhone,
        "blocked": blocked == null ? null : blocked,
        "phones": phones,
        "device_id": deviceId == null ? null : deviceId,
        "telegram_id": telegramId == null ? null : telegramId,
        "comment": comment == null ? null : comment,
        "activity": activity == null ? null : activity,
        "default_payment_type": defaultPaymentType == null ? null : defaultPaymentType,
        "promotion": promotion == null ? null : promotion.toJson(),
        "referral_program_data": referralProgramData == null ? null : referralProgramData.toJson(),
        "blacklist": blacklist,
    };
}

class ClientPromotion {
    ClientPromotion({
        this.booster,
        this.isVip,
    });

    final bool booster;
    final bool isVip;

    factory ClientPromotion.fromJson(Map<String, dynamic> json) => ClientPromotion(
        booster: json["booster"] == null ? null : json["booster"],
        isVip: json["is_vip"] == null ? null : json["is_vip"],
    );

    Map<String, dynamic> toJson() => {
        "booster": booster == null ? null : booster,
        "is_vip": isVip == null ? null : isVip,
    };
}

class ReferralProgramData {
    ReferralProgramData({
        this.enable,
        this.referralCode,
        this.parentUuid,
        this.referralParentCode,
        this.referralParentPhone,
        this.activationCount,
        this.recipientsTravelCount,
        this.isNewcomer,
    });

    final bool enable;
    final String referralCode;
    final String parentUuid;
    final String referralParentCode;
    final String referralParentPhone;
    final int activationCount;
    final int recipientsTravelCount;
    final bool isNewcomer;

    factory ReferralProgramData.fromJson(Map<String, dynamic> json) => ReferralProgramData(
        enable: json["enable"] == null ? null : json["enable"],
        referralCode: json["referral_code"] == null ? null : json["referral_code"],
        parentUuid: json["parent_uuid"] == null ? null : json["parent_uuid"],
        referralParentCode: json["referral_parent_code"] == null ? null : json["referral_parent_code"],
        referralParentPhone: json["referral_parent_phone"] == null ? null : json["referral_parent_phone"],
        activationCount: json["activation_count"] == null ? null : json["activation_count"],
        recipientsTravelCount: json["recipients_travel_count"] == null ? null : json["recipients_travel_count"],
        isNewcomer: json["is_newcomer"] == null ? null : json["is_newcomer"],
    );

    Map<String, dynamic> toJson() => {
        "enable": enable == null ? null : enable,
        "referral_code": referralCode == null ? null : referralCode,
        "parent_uuid": parentUuid == null ? null : parentUuid,
        "referral_parent_code": referralParentCode == null ? null : referralParentCode,
        "referral_parent_phone": referralParentPhone == null ? null : referralParentPhone,
        "activation_count": activationCount == null ? null : activationCount,
        "recipients_travel_count": recipientsTravelCount == null ? null : recipientsTravelCount,
        "is_newcomer": isNewcomer == null ? null : isNewcomer,
    };
}

class Rating {
    Rating({
        this.value,
        this.comment,
    });

    final int value;
    final String comment;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        value: json["value"] == null ? null : json["value"],
        comment: json["comment"] == null ? null : json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "comment": comment == null ? null : comment,
    };
}

class Driver {
    Driver({
        this.uuid,
        this.name,
        this.paymentTypes,
        this.phone,
        this.comment,
        this.stateName,
        this.car,
        this.balance,
        this.cardBalance,
        this.karma,
        this.color,
        this.tariff,
        this.tag,
        this.availableServices,
        this.availableFeatures,
        this.alias,
        this.regNumber,
        this.activity,
        this.promotion,
        this.group,
        this.blacklist,
        this.meta,
        this.counterOrderSwitch,
        this.taxiParkData,
        this.taxiParkUuid,
    });

    final String uuid;
    final String name;
    final List<String> paymentTypes;
    final String phone;
    final String comment;
    final String stateName;
    final String car;
    final int balance;
    final int cardBalance;
    final int karma;
    final String color;
    final DriverTariff tariff;
    final List<String> tag;
    final List<AvailableService> availableServices;
    final List<dynamic> availableFeatures;
    final int alias;
    final String regNumber;
    final int activity;
    final DriverPromotion promotion;
    final Group group;
    final dynamic blacklist;
    final Meta meta;
    final dynamic counterOrderSwitch;
    final TaxiParkData taxiParkData;
    final String taxiParkUuid;

    factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        uuid: json["uuid"] == null ? null : json["uuid"],
        name: json["name"] == null ? null : json["name"],
        paymentTypes: json["payment_types"] == null ? null : List<String>.from(json["payment_types"].map((x) => x)),
        phone: json["phone"] == null ? null : json["phone"],
        comment: json["comment"] == null ? null : json["comment"],
        stateName: json["state_name"] == null ? null : json["state_name"],
        car: json["car"] == null ? null : json["car"],
        balance: json["balance"] == null ? null : json["balance"],
        cardBalance: json["card_balance"] == null ? null : json["card_balance"],
        karma: json["karma"] == null ? null : json["karma"],
        color: json["color"] == null ? null : json["color"],
        tariff: json["tariff"] == null ? null : DriverTariff.fromJson(json["tariff"]),
        tag: json["tag"] == null ? null : List<String>.from(json["tag"].map((x) => x)),
        availableServices: json["available_services"] == null ? null : List<AvailableService>.from(json["available_services"].map((x) => AvailableService.fromJson(x))),
        availableFeatures: json["available_features"] == null ? null : List<dynamic>.from(json["available_features"].map((x) => x)),
        alias: json["alias"] == null ? null : json["alias"],
        regNumber: json["reg_number"] == null ? null : json["reg_number"],
        activity: json["activity"] == null ? null : json["activity"],
        promotion: json["promotion"] == null ? null : DriverPromotion.fromJson(json["promotion"]),
        group: json["group"] == null ? null : Group.fromJson(json["group"]),
        blacklist: json["blacklist"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        counterOrderSwitch: json["counter_order_switch"],
        taxiParkData: json["taxi_park_data"] == null ? null : TaxiParkData.fromJson(json["taxi_park_data"]),
        taxiParkUuid: json["taxi_park_uuid"] == null ? null : json["taxi_park_uuid"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "name": name == null ? null : name,
        "payment_types": paymentTypes == null ? null : List<dynamic>.from(paymentTypes.map((x) => x)),
        "phone": phone == null ? null : phone,
        "comment": comment == null ? null : comment,
        "state_name": stateName == null ? null : stateName,
        "car": car == null ? null : car,
        "balance": balance == null ? null : balance,
        "card_balance": cardBalance == null ? null : cardBalance,
        "karma": karma == null ? null : karma,
        "color": color == null ? null : color,
        "tariff": tariff == null ? null : tariff.toJson(),
        "tag": tag == null ? null : List<dynamic>.from(tag.map((x) => x)),
        "available_services": availableServices == null ? null : List<dynamic>.from(availableServices.map((x) => x.toJson())),
        "available_features": availableFeatures == null ? null : List<dynamic>.from(availableFeatures.map((x) => x)),
        "alias": alias == null ? null : alias,
        "reg_number": regNumber == null ? null : regNumber,
        "activity": activity == null ? null : activity,
        "promotion": promotion == null ? null : promotion.toJson(),
        "group": group == null ? null : group.toJson(),
        "blacklist": blacklist,
        "meta": meta == null ? null : meta.toJson(),
        "counter_order_switch": counterOrderSwitch,
        "taxi_park_data": taxiParkData == null ? null : taxiParkData.toJson(),
        "taxi_park_uuid": taxiParkUuid == null ? null : taxiParkUuid,
    };
}

class AvailableService {
    AvailableService({
        this.uuid,
        this.name,
        this.priceCoefficient,
        this.freight,
        this.productDelivery,
        this.comment,
        this.maxBonusPaymentPercent,
        this.image,
        this.imagesSet,
        this.tag,
    });

    final String uuid;
    final String name;
    var priceCoefficient;
    final bool freight;
    final bool productDelivery;
    final String comment;
    final int maxBonusPaymentPercent;
    final String image;
    final AvailableServiceImagesSet imagesSet;
    final List<String> tag;

    factory AvailableService.fromJson(Map<String, dynamic> json) => AvailableService(
        uuid: json["uuid"] == null ? null : json["uuid"],
        name: json["name"] == null ? null : json["name"],
        priceCoefficient: json["price_coefficient"] == null ? null : json["price_coefficient"],
        freight: json["freight"] == null ? null : json["freight"],
        productDelivery: json["product_delivery"] == null ? null : json["product_delivery"],
        comment: json["comment"] == null ? null : json["comment"],
        maxBonusPaymentPercent: json["max_bonus_payment_percent"] == null ? null : json["max_bonus_payment_percent"],
        image: json["image"] == null ? null : json["image"],
        imagesSet: json["images_set"] == null ? null : AvailableServiceImagesSet.fromJson(json["images_set"]),
        tag: json["tag"] == null ? null : List<String>.from(json["tag"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "name": name == null ? null : name,
        "price_coefficient": priceCoefficient == null ? null : priceCoefficient,
        "freight": freight == null ? null : freight,
        "product_delivery": productDelivery == null ? null : productDelivery,
        "comment": comment == null ? null : comment,
        "max_bonus_payment_percent": maxBonusPaymentPercent == null ? null : maxBonusPaymentPercent,
        "image": image == null ? null : image,
        "images_set": imagesSet == null ? null : imagesSet.toJson(),
        "tag": tag == null ? null : List<dynamic>.from(tag.map((x) => x)),
    };
}

class AvailableServiceImagesSet {
    AvailableServiceImagesSet();

    factory AvailableServiceImagesSet.fromJson(Map<String, dynamic> json) => AvailableServiceImagesSet(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Group {
    Group({
        this.uuid,
        this.name,
        this.description,
        this.distributionWeight,
        this.servicesUuid,
        this.photocontrolTemplates,
        this.tag,
        this.defaultTariffUuid,
        this.defaultTariffOfflineUuid,
    });

    final String uuid;
    final String name;
    final String description;
    final int distributionWeight;
    final dynamic servicesUuid;
    final dynamic photocontrolTemplates;
    final dynamic tag;
    final String defaultTariffUuid;
    final String defaultTariffOfflineUuid;

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        uuid: json["uuid"] == null ? null : json["uuid"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        distributionWeight: json["distribution_weight"] == null ? null : json["distribution_weight"],
        servicesUuid: json["services_uuid"],
        photocontrolTemplates: json["photocontrol_templates"],
        tag: json["tag"],
        defaultTariffUuid: json["default_tariff_uuid"] == null ? null : json["default_tariff_uuid"],
        defaultTariffOfflineUuid: json["default_tariff_offline_uuid"] == null ? null : json["default_tariff_offline_uuid"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "distribution_weight": distributionWeight == null ? null : distributionWeight,
        "services_uuid": servicesUuid,
        "photocontrol_templates": photocontrolTemplates,
        "tag": tag,
        "default_tariff_uuid": defaultTariffUuid == null ? null : defaultTariffUuid,
        "default_tariff_offline_uuid": defaultTariffOfflineUuid == null ? null : defaultTariffOfflineUuid,
    };
}

class Meta {
    Meta({
        this.blockedAt,
        this.blockedUntil,
        this.unblockedAt,
    });

    final int blockedAt;
    final int blockedUntil;
    final int unblockedAt;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        blockedAt: json["blocked_at"] == null ? null : json["blocked_at"],
        blockedUntil: json["blocked_until"] == null ? null : json["blocked_until"],
        unblockedAt: json["unblocked_at"] == null ? null : json["unblocked_at"],
    );

    Map<String, dynamic> toJson() => {
        "blocked_at": blockedAt == null ? null : blockedAt,
        "blocked_until": blockedUntil == null ? null : blockedUntil,
        "unblocked_at": unblockedAt == null ? null : unblockedAt,
    };
}

class DriverPromotion {
    DriverPromotion({
        this.booster,
        this.rentedAuto,
        this.brandSticker,
        this.haveOrder,
        this.scoringBoostTimeByPhotocontrolPassed,
    });

    final bool booster;
    final bool rentedAuto;
    final bool brandSticker;
    final bool haveOrder;
    final int scoringBoostTimeByPhotocontrolPassed;

    factory DriverPromotion.fromJson(Map<String, dynamic> json) => DriverPromotion(
        booster: json["booster"] == null ? null : json["booster"],
        rentedAuto: json["rented_auto"] == null ? null : json["rented_auto"],
        brandSticker: json["brand_sticker"] == null ? null : json["brand_sticker"],
        haveOrder: json["have_order"] == null ? null : json["have_order"],
        scoringBoostTimeByPhotocontrolPassed: json["scoring_boost_time_by_photocontrol_passed"] == null ? null : json["scoring_boost_time_by_photocontrol_passed"],
    );

    Map<String, dynamic> toJson() => {
        "booster": booster == null ? null : booster,
        "rented_auto": rentedAuto == null ? null : rentedAuto,
        "brand_sticker": brandSticker == null ? null : brandSticker,
        "have_order": haveOrder == null ? null : haveOrder,
        "scoring_boost_time_by_photocontrol_passed": scoringBoostTimeByPhotocontrolPassed == null ? null : scoringBoostTimeByPhotocontrolPassed,
    };
}

class DriverTariff {
    DriverTariff({
        this.uuid,
        this.offline,
        this.driversGroupsUuid,
        this.tariffDefault,
        this.isSecret,
        this.tariffType,
        this.name,
        this.comment,
        this.color,
        this.rejExp,
        this.commExp,
        this.period,
        this.periodPrice,
        this.payedAt,
    });

    final String uuid;
    final bool offline;
    final List<String> driversGroupsUuid;
    final bool tariffDefault;
    final bool isSecret;
    final String tariffType;
    final String name;
    final String comment;
    final String color;
    final String rejExp;
    final String commExp;
    final int period;
    final int periodPrice;
    final int payedAt;

    factory DriverTariff.fromJson(Map<String, dynamic> json) => DriverTariff(
        uuid: json["uuid"] == null ? null : json["uuid"],
        offline: json["offline"] == null ? null : json["offline"],
        driversGroupsUuid: json["drivers_groups_uuid"] == null ? null : List<String>.from(json["drivers_groups_uuid"].map((x) => x)),
        tariffDefault: json["default"] == null ? null : json["default"],
        isSecret: json["is_secret"] == null ? null : json["is_secret"],
        tariffType: json["tariff_type"] == null ? null : json["tariff_type"],
        name: json["name"] == null ? null : json["name"],
        comment: json["comment"] == null ? null : json["comment"],
        color: json["color"] == null ? null : json["color"],
        rejExp: json["rej_exp"] == null ? null : json["rej_exp"],
        commExp: json["comm_exp"] == null ? null : json["comm_exp"],
        period: json["period"] == null ? null : json["period"],
        periodPrice: json["period_price"] == null ? null : json["period_price"],
        payedAt: json["payed_at"] == null ? null : json["payed_at"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "offline": offline == null ? null : offline,
        "drivers_groups_uuid": driversGroupsUuid == null ? null : List<dynamic>.from(driversGroupsUuid.map((x) => x)),
        "default": tariffDefault == null ? null : tariffDefault,
        "is_secret": isSecret == null ? null : isSecret,
        "tariff_type": tariffType == null ? null : tariffType,
        "name": name == null ? null : name,
        "comment": comment == null ? null : comment,
        "color": color == null ? null : color,
        "rej_exp": rejExp == null ? null : rejExp,
        "comm_exp": commExp == null ? null : commExp,
        "period": period == null ? null : period,
        "period_price": periodPrice == null ? null : periodPrice,
        "payed_at": payedAt == null ? null : payedAt,
    };
}

class TaxiParkData {
    TaxiParkData({
        this.uuid,
        this.name,
        this.comment,
        this.friendlyUuid,
        this.unwantedUuid,
        this.regionUuid,
        this.representative,
    });

    final String uuid;
    final String name;
    final String comment;
    final dynamic friendlyUuid;
    final dynamic unwantedUuid;
    final String regionUuid;
    final Representative representative;

    factory TaxiParkData.fromJson(Map<String, dynamic> json) => TaxiParkData(
        uuid: json["uuid"] == null ? null : json["uuid"],
        name: json["name"] == null ? null : json["name"],
        comment: json["comment"] == null ? null : json["comment"],
        friendlyUuid: json["friendly_uuid"],
        unwantedUuid: json["unwanted_uuid"],
        regionUuid: json["region_uuid"] == null ? null : json["region_uuid"],
        representative: json["representative"] == null ? null : Representative.fromJson(json["representative"]),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "name": name == null ? null : name,
        "comment": comment == null ? null : comment,
        "friendly_uuid": friendlyUuid,
        "unwanted_uuid": unwantedUuid,
        "region_uuid": regionUuid == null ? null : regionUuid,
        "representative": representative == null ? null : representative.toJson(),
    };
}

class Representative {
    Representative({
        this.name,
        this.inn,
    });

    final String name;
    final String inn;

    factory Representative.fromJson(Map<String, dynamic> json) => Representative(
        name: json["name"] == null ? null : json["name"],
        inn: json["inn"] == null ? null : json["inn"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "inn": inn == null ? null : inn,
    };
}

class PaymentMeta {
    PaymentMeta({
        this.isPrepaid,
        this.receiptUrl,
        this.qrCodeUrl,
        this.additionalData,
    });

    final bool isPrepaid;
    final String receiptUrl;
    final String qrCodeUrl;
    final dynamic additionalData;

    factory PaymentMeta.fromJson(Map<String, dynamic> json) => PaymentMeta(
        isPrepaid: json["_is_prepaid"] == null ? null : json["_is_prepaid"],
        receiptUrl: json["receipt_url"] == null ? null : json["receipt_url"],
        qrCodeUrl: json["qr_code_url"] == null ? null : json["qr_code_url"],
        additionalData: json["additional_data"],
    );

    Map<String, dynamic> toJson() => {
        "_is_prepaid": isPrepaid == null ? null : isPrepaid,
        "receipt_url": receiptUrl == null ? null : receiptUrl,
        "qr_code_url": qrCodeUrl == null ? null : qrCodeUrl,
        "additional_data": additionalData,
    };
}

class PhoneLine {
    PhoneLine({
        this.uuid,
        this.serviceUuid,
        this.name,
        this.comment,
    });

    final String uuid;
    final String serviceUuid;
    final String name;
    final String comment;

    factory PhoneLine.fromJson(Map<String, dynamic> json) => PhoneLine(
        uuid: json["uuid"] == null ? null : json["uuid"],
        serviceUuid: json["service_uuid"] == null ? null : json["service_uuid"],
        name: json["name"] == null ? null : json["name"],
        comment: json["comment"] == null ? null : json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "service_uuid": serviceUuid == null ? null : serviceUuid,
        "name": name == null ? null : name,
        "comment": comment == null ? null : comment,
    };
}

class ProductsData {
    ProductsData({
        this.store,
        this.preparationTime,
        this.confirmationTime,
        this.buyout,
        this.orderNumberInStore,
        this.products,
    });

    final Store store;
    final int preparationTime;
    final int confirmationTime;
    final bool buyout;
    final String orderNumberInStore;
    final List<Product> products;

    factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
        store: json["store"] == null ? null : Store.fromJson(json["store"]),
        preparationTime: json["preparation_time"] == null ? null : json["preparation_time"],
        confirmationTime: json["confirmation_time"] == null ? null : json["confirmation_time"],
        buyout: json["buyout"] == null ? null : json["buyout"],
        orderNumberInStore: json["order_number_in_store"] == null ? null : json["order_number_in_store"],
        products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "store": store == null ? null : store.toJson(),
        "preparation_time": preparationTime == null ? null : preparationTime,
        "confirmation_time": confirmationTime == null ? null : confirmationTime,
        "buyout": buyout == null ? null : buyout,
        "order_number_in_store": orderNumberInStore == null ? null : orderNumberInStore,
        "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.uuid,
        this.weight,
        this.weightMeasure,
        this.name,
        this.comment,
        this.available,
        this.visible,
        this.price,
        this.image,
        this.storeUuid,
        this.toppings,
        this.number,
        this.selectedVariant,
    });

    final String uuid;
    final String weight;
    final String weightMeasure;
    final String name;
    final String comment;
    final bool available;
    final bool visible;
    final int price;
    final String image;
    final String storeUuid;
    final dynamic toppings;
    final int number;
    final SelectedVariant selectedVariant;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        uuid: json["uuid"] == null ? null : json["uuid"],
        weight: json["weight"] == null ? null : json["weight"],
        weightMeasure: json["weight_measure"] == null ? null : json["weight_measure"],
        name: json["name"] == null ? null : json["name"],
        comment: json["comment"] == null ? null : json["comment"],
        available: json["available"] == null ? null : json["available"],
        visible: json["visible"] == null ? null : json["visible"],
        price: json["price"] == null ? null : json["price"],
        image: json["image"] == null ? null : json["image"],
        storeUuid: json["store_uuid"] == null ? null : json["store_uuid"],
        toppings: json["toppings"],
        number: json["number"] == null ? null : json["number"],
        selectedVariant: json["selected_variant"] == null ? null : SelectedVariant.fromJson(json["selected_variant"]),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "weight": weight == null ? null : weight,
        "weight_measure": weightMeasure == null ? null : weightMeasure,
        "name": name == null ? null : name,
        "comment": comment == null ? null : comment,
        "available": available == null ? null : available,
        "visible": visible == null ? null : visible,
        "price": price == null ? null : price,
        "image": image == null ? null : image,
        "store_uuid": storeUuid == null ? null : storeUuid,
        "toppings": toppings,
        "number": number == null ? null : number,
        "selected_variant": selectedVariant == null ? null : selectedVariant.toJson(),
    };
}

class SelectedVariant {
    SelectedVariant({
        this.uuid,
        this.name,
        this.standard,
        this.price,
        this.comment,
    });

    final String uuid;
    final String name;
    final bool standard;
    final int price;
    final String comment;

    factory SelectedVariant.fromJson(Map<String, dynamic> json) => SelectedVariant(
        uuid: json["uuid"] == null ? null : json["uuid"],
        name: json["name"] == null ? null : json["name"],
        standard: json["standard"] == null ? null : json["standard"],
        price: json["price"] == null ? null : json["price"],
        comment: json["comment"] == null ? null : json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "name": name == null ? null : name,
        "standard": standard == null ? null : standard,
        "price": price == null ? null : price,
        "comment": comment == null ? null : comment,
    };
}

class Store {
    Store({
        this.uuid,
        this.name,
        this.phone,
        this.staffPhones,
        this.comment,
        this.needToEnter,
        this.ownDelivery,
        this.image,
        this.available,
        this.visible,
        this.serialNumber,
        this.workSchedule,
        this.type,
        this.productCategory,
        this.orderPreparationTimeSecond,
        this.averageCheck,
        this.paymentTypes,
        this.categories,
    });

    final String uuid;
    final String name;
    final String phone;
    final dynamic staffPhones;
    final String comment;
    final bool needToEnter;
    final bool ownDelivery;
    final String image;
    final bool available;
    final bool visible;
    final int serialNumber;
    final List<WorkSchedule> workSchedule;
    final String type;
    final List<String> productCategory;
    final int orderPreparationTimeSecond;
    final int averageCheck;
    final dynamic paymentTypes;
    final dynamic categories;

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        uuid: json["uuid"] == null ? null : json["uuid"],
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        staffPhones: json["staff_phones"],
        comment: json["comment"] == null ? null : json["comment"],
        needToEnter: json["need_to_enter"] == null ? null : json["need_to_enter"],
        ownDelivery: json["own_delivery"] == null ? null : json["own_delivery"],
        image: json["image"] == null ? null : json["image"],
        available: json["available"] == null ? null : json["available"],
        visible: json["visible"] == null ? null : json["visible"],
        serialNumber: json["serial_number"] == null ? null : json["serial_number"],
        workSchedule: json["work_schedule"] == null ? null : List<WorkSchedule>.from(json["work_schedule"].map((x) => WorkSchedule.fromJson(x))),
        type: json["type"] == null ? null : json["type"],
        productCategory: json["product_category"] == null ? null : List<String>.from(json["product_category"].map((x) => x)),
        orderPreparationTimeSecond: json["order_preparation_time_second"] == null ? null : json["order_preparation_time_second"],
        averageCheck: json["average_check"] == null ? null : json["average_check"],
        paymentTypes: json["payment_types"],
        categories: json["categories"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "name": name == null ? null : name,
        "phone": phone == null ? null : phone,
        "staff_phones": staffPhones,
        "comment": comment == null ? null : comment,
        "need_to_enter": needToEnter == null ? null : needToEnter,
        "own_delivery": ownDelivery == null ? null : ownDelivery,
        "image": image == null ? null : image,
        "available": available == null ? null : available,
        "visible": visible == null ? null : visible,
        "serial_number": serialNumber == null ? null : serialNumber,
        "work_schedule": workSchedule == null ? null : List<dynamic>.from(workSchedule.map((x) => x.toJson())),
        "type": type == null ? null : type,
        "product_category": productCategory == null ? null : List<dynamic>.from(productCategory.map((x) => x)),
        "order_preparation_time_second": orderPreparationTimeSecond == null ? null : orderPreparationTimeSecond,
        "average_check": averageCheck == null ? null : averageCheck,
        "payment_types": paymentTypes,
        "categories": categories,
    };
}

class WorkSchedule {
    WorkSchedule({
        this.weekDay,
        this.dayOff,
        this.workBeginning,
        this.workEnding,
    });

    final int weekDay;
    final bool dayOff;
    final int workBeginning;
    final int workEnding;

    factory WorkSchedule.fromJson(Map<String, dynamic> json) => WorkSchedule(
        weekDay: json["week_day"] == null ? null : json["week_day"],
        dayOff: json["day_off"] == null ? null : json["day_off"],
        workBeginning: json["work_beginning"] == null ? null : json["work_beginning"],
        workEnding: json["work_ending"] == null ? null : json["work_ending"],
    );

    Map<String, dynamic> toJson() => {
        "week_day": weekDay == null ? null : weekDay,
        "day_off": dayOff == null ? null : dayOff,
        "work_beginning": workBeginning == null ? null : workBeginning,
        "work_ending": workEnding == null ? null : workEnding,
    };
}

class MyOrderPromotion {
    MyOrderPromotion({
        this.isVip,
        this.isUnpaid,
    });

    final bool isVip;
    final bool isUnpaid;

    factory MyOrderPromotion.fromJson(Map<String, dynamic> json) => MyOrderPromotion(
        isVip: json["is_vip"] == null ? null : json["is_vip"],
        isUnpaid: json["is_unpaid"] == null ? null : json["is_unpaid"],
    );

    Map<String, dynamic> toJson() => {
        "is_vip": isVip == null ? null : isVip,
        "is_unpaid": isUnpaid == null ? null : isUnpaid,
    };
}

class RouteWayData {
    RouteWayData({
        this.routes,
        this.routeFromDriverToClient,
        this.steps,
    });

    final Routes routes;
    final RouteFromDriverToClient routeFromDriverToClient;
    final List<Routes> steps;

    factory RouteWayData.fromJson(Map<String, dynamic> json) => RouteWayData(
        routes: json["routes"] == null ? null : Routes.fromJson(json["routes"]),
        routeFromDriverToClient: json["route_from_driver_to_client"] == null ? null : RouteFromDriverToClient.fromJson(json["route_from_driver_to_client"]),
        steps: json["steps"] == null ? null : List<Routes>.from(json["steps"].map((x) => Routes.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "routes": routes == null ? null : routes.toJson(),
        "route_from_driver_to_client": routeFromDriverToClient == null ? null : routeFromDriverToClient.toJson(),
        "steps": steps == null ? null : List<dynamic>.from(steps.map((x) => x.toJson())),
    };
}

class RouteFromDriverToClient {
    RouteFromDriverToClient({
        this.geometry,
        this.type,
        this.properties,
    });

    final Geometry geometry;
    final String type;
    final Properties properties;

    factory RouteFromDriverToClient.fromJson(Map<String, dynamic> json) => RouteFromDriverToClient(
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        type: json["type"] == null ? null : json["type"],
        properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
    );

    Map<String, dynamic> toJson() => {
        "geometry": geometry == null ? null : geometry.toJson(),
        "type": type == null ? null : type,
        "properties": properties == null ? null : properties.toJson(),
    };
}

class Geometry {
    Geometry({
        this.coordinates,
        this.type,
    });

    final List<List<double>> coordinates;
    final String type;

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates: json["coordinates"] == null ? null : List<List<double>>.from(json["coordinates"].map((x) => List<double>.from(x.map((x) => x.toDouble())))),
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "type": type == null ? null : type,
    };
}

class Properties {
    Properties({
        this.duration,
        this.distance,
    });

    final int duration;
    final double distance;

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        duration: json["duration"] == null ? null : json["duration"],
        distance: json["distance"] == null ? null : json["distance"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "duration": duration == null ? null : duration,
        "distance": distance == null ? null : distance,
    };
}

class Routes {
    Routes({
        this.geometry,
        this.type,
        this.properties,
    });

    final Geometry geometry;
    final String type;
    final Properties properties;

    factory Routes.fromJson(Map<String, dynamic> json) => Routes(
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        type: json["type"] == null ? null : json["type"],
        properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
    );

    Map<String, dynamic> toJson() => {
        "geometry": geometry == null ? null : geometry.toJson(),
        "type": type == null ? null : type,
        "properties": properties == null ? null : properties.toJson(),
    };
}

class Route {
    Route({
        this.uuid,
        this.pointType,
        this.unrestrictedValue,
        this.value,
        this.country,
        this.region,
        this.regionType,
        this.type,
        this.city,
        this.category,
        this.cityType,
        this.street,
        this.streetType,
        this.streetWithType,
        this.house,
        this.frontDoor,
        this.comment,
        this.outOfTown,
        this.houseType,
        this.accuracyLevel,
        this.radius,
        this.lat,
        this.lon,
    });

    final String uuid;
    final String pointType;
    final String unrestrictedValue;
    final String value;
    final String country;
    final String region;
    final String regionType;
    final String type;
    final String city;
    final String category;
    final String cityType;
    final String street;
    final String streetType;
    final String streetWithType;
    final String house;
    final int frontDoor;
    final String comment;
    final bool outOfTown;
    final String houseType;
    final int accuracyLevel;
    final int radius;
    final double lat;
    final double lon;

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        uuid: json["uuid"] == null ? null : json["uuid"],
        pointType: json["point_type"] == null ? null : json["point_type"],
        unrestrictedValue: json["unrestricted_value"] == null ? null : json["unrestricted_value"],
        value: json["value"] == null ? null : json["value"],
        country: json["country"] == null ? null : json["country"],
        region: json["region"] == null ? null : json["region"],
        regionType: json["region_type"] == null ? null : json["region_type"],
        type: json["type"] == null ? null : json["type"],
        city: json["city"] == null ? null : json["city"],
        category: json["category"] == null ? null : json["category"],
        cityType: json["city_type"] == null ? null : json["city_type"],
        street: json["street"] == null ? null : json["street"],
        streetType: json["street_type"] == null ? null : json["street_type"],
        streetWithType: json["street_with_type"] == null ? null : json["street_with_type"],
        house: json["house"] == null ? null : json["house"],
        frontDoor: json["front_door"] == null ? null : json["front_door"],
        comment: json["comment"] == null ? null : json["comment"],
        outOfTown: json["out_of_town"] == null ? null : json["out_of_town"],
        houseType: json["house_type"] == null ? null : json["house_type"],
        accuracyLevel: json["accuracy_level"] == null ? null : json["accuracy_level"],
        radius: json["radius"] == null ? null : json["radius"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "point_type": pointType == null ? null : pointType,
        "unrestricted_value": unrestrictedValue == null ? null : unrestrictedValue,
        "value": value == null ? null : value,
        "country": country == null ? null : country,
        "region": region == null ? null : region,
        "region_type": regionType == null ? null : regionType,
        "type": type == null ? null : type,
        "city": city == null ? null : city,
        "category": category == null ? null : category,
        "city_type": cityType == null ? null : cityType,
        "street": street == null ? null : street,
        "street_type": streetType == null ? null : streetType,
        "street_with_type": streetWithType == null ? null : streetWithType,
        "house": house == null ? null : house,
        "front_door": frontDoor == null ? null : frontDoor,
        "comment": comment == null ? null : comment,
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
        this.productDelivery,
        this.comment,
        this.maxBonusPaymentPercent,
        this.image,
        this.imagesSet,
        this.tag,
    });

    final String uuid;
    final String name;
    final double priceCoefficient;
    final bool freight;
    final bool productDelivery;
    final String comment;
    final int maxBonusPaymentPercent;
    final String image;
    final ServiceImagesSet imagesSet;
    final List<String> tag;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        uuid: json["uuid"] == null ? null : json["uuid"],
        name: json["name"] == null ? null : json["name"],
        priceCoefficient: json["price_coefficient"] == null ? null : json["price_coefficient"].toDouble(),
        freight: json["freight"] == null ? null : json["freight"],
        productDelivery: json["product_delivery"] == null ? null : json["product_delivery"],
        comment: json["comment"] == null ? null : json["comment"],
        maxBonusPaymentPercent: json["max_bonus_payment_percent"] == null ? null : json["max_bonus_payment_percent"],
        image: json["image"] == null ? null : json["image"],
        imagesSet: json["images_set"] == null ? null : ServiceImagesSet.fromJson(json["images_set"]),
        tag: json["tag"] == null ? null : List<String>.from(json["tag"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "name": name == null ? null : name,
        "price_coefficient": priceCoefficient == null ? null : priceCoefficient,
        "freight": freight == null ? null : freight,
        "product_delivery": productDelivery == null ? null : productDelivery,
        "comment": comment == null ? null : comment,
        "max_bonus_payment_percent": maxBonusPaymentPercent == null ? null : maxBonusPaymentPercent,
        "image": image == null ? null : image,
        "images_set": imagesSet == null ? null : imagesSet.toJson(),
        "tag": tag == null ? null : List<dynamic>.from(tag.map((x) => x)),
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

class MyOrderTariff {
    MyOrderTariff({
        this.name,
        this.totalPrice,
        this.fixedPrice,
        this.productsPrice,
        this.guaranteedDriverIncome,
        this.guaranteedDriverIncomeForDelivery,
        this.supplementToGuaranteedIncome,
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
        this.surge,
        this.insuranceCost,
        this.precalculated,
    });

    final String name;
    final int totalPrice;
    final int fixedPrice;
    final int productsPrice;
    final int guaranteedDriverIncome;
    final int guaranteedDriverIncomeForDelivery;
    final int supplementToGuaranteedIncome;
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
    final Map<String, int> timeTaximeter;
    final int waitingPrice;
    final Surge surge;
    final int insuranceCost;
    final String precalculated;

    factory MyOrderTariff.fromJson(Map<String, dynamic> json) => MyOrderTariff(
        name: json["name"] == null ? null : json["name"],
        totalPrice: json["total_price"] == null ? null : json["total_price"],
        fixedPrice: json["fixed_price"] == null ? null : json["fixed_price"],
        productsPrice: json["products_price"] == null ? null : json["products_price"],
        guaranteedDriverIncome: json["guaranteed_driver_income"] == null ? null : json["guaranteed_driver_income"],
        guaranteedDriverIncomeForDelivery: json["guaranteed_driver_income_for_delivery"] == null ? null : json["guaranteed_driver_income_for_delivery"],
        supplementToGuaranteedIncome: json["supplement_to_guaranteed_income"] == null ? null : json["supplement_to_guaranteed_income"],
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
        timeTaximeter: json["time_taximeter"] == null ? null : Map.from(json["time_taximeter"]).map((k, v) => MapEntry<String, int>(k, v)),
        waitingPrice: json["waiting_price"] == null ? null : json["waiting_price"],
        surge: json["surge"] == null ? null : Surge.fromJson(json["surge"]),
        insuranceCost: json["insurance_cost"] == null ? null : json["insurance_cost"],
        precalculated: json["precalculated"] == null ? null : json["precalculated"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "total_price": totalPrice == null ? null : totalPrice,
        "fixed_price": fixedPrice == null ? null : fixedPrice,
        "products_price": productsPrice == null ? null : productsPrice,
        "guaranteed_driver_income": guaranteedDriverIncome == null ? null : guaranteedDriverIncome,
        "guaranteed_driver_income_for_delivery": guaranteedDriverIncomeForDelivery == null ? null : guaranteedDriverIncomeForDelivery,
        "supplement_to_guaranteed_income": supplementToGuaranteedIncome == null ? null : supplementToGuaranteedIncome,
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
        "time_taximeter": timeTaximeter == null ? null : Map.from(timeTaximeter).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "waiting_price": waitingPrice == null ? null : waitingPrice,
        "surge": surge == null ? null : surge.toJson(),
        "insurance_cost": insuranceCost == null ? null : insuranceCost,
        "precalculated": precalculated == null ? null : precalculated,
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
