class ServiceModel {
  String message;
  String title;
  String description;
  String status;
  String comments;
  String source_type;
  OperatorData operatorData;
  DriverData driverData;
  ClientData clientData;
  OrderData orderData;
  int created_at_unix;

  ServiceModel( {
    this.message,
    this.title,
    this.description,
    this.status,
    this.comments,
    this.source_type,
    this.operatorData,
    this.driverData,
    this.clientData,
    this.orderData,
    this.created_at_unix,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> parsedJson){

    var operator_data_list = parsedJson['operator_data'];
    OperatorData operatorDataList = null;
    if(operator_data_list != null){
      OperatorData.fromJson(operator_data_list);
    }

    var driver_data_list = parsedJson['driver_data'];
    DriverData driverDataList = null;
    if(driver_data_list != null){
      DriverData.fromJson(driver_data_list);
    }

    var client_data_list = parsedJson['client_data'];
    ClientData clientDataList = null;
    if(client_data_list != null){
      ClientData.fromJson(client_data_list);
    }

    var order_data_list = parsedJson['order_data'];
    OrderData orderDataList = null;
    if(order_data_list != null){
      OrderData.fromJson(order_data_list);
    }

    return ServiceModel(
        message:parsedJson['message'],
        title:parsedJson['title'],
        description:parsedJson['description'],
        status:parsedJson['status'],
        comments:parsedJson['comments'],
        source_type:parsedJson['source_type'],
        operatorData: operatorDataList,
        driverData: driverDataList,
        clientData: clientDataList,
        orderData: orderDataList,
        created_at_unix: parsedJson['created_at_unix']

    );
  }
}

class OperatorData{
  String name;
  String uuid;

  OperatorData( {
    this.name,
    this.uuid
  });

  factory OperatorData.fromJson(Map<String, dynamic> parsedJson){

    return OperatorData(
        name:parsedJson['name'],
        uuid:parsedJson['uuid']
    );
  }
}

class DriverData{
  String name;
  String uuid;

  DriverData( {
    this.name,
    this.uuid
  });

  factory DriverData.fromJson(Map<String, dynamic> parsedJson){

    return DriverData(
        name:parsedJson['name'],
        uuid:parsedJson['uuid']
    );
  }
}

class ClientData{
  String phone;
  String uuid;

  ClientData( {
    this.phone,
    this.uuid
  });

  factory ClientData.fromJson(Map<String, dynamic> parsedJson){

    return ClientData(
        phone:parsedJson['phone'],
        uuid:parsedJson['uuid']
    );
  }
}

class OrderData{
  int id;
  String uuid;

  OrderData( {
    this.id,
    this.uuid
  });

  factory OrderData.fromJson(Map<String, dynamic> parsedJson){

    return OrderData(
        id:parsedJson['id'],
        uuid:parsedJson['uuid']
    );
  }
}