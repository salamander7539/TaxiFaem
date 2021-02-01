class PaymentRegisterWithVerification{
  int transaction_id;
  String payment_req;
  String acs_url;
  String callback_url;

  PaymentRegisterWithVerification( {
    this.transaction_id,
    this.payment_req,
    this.acs_url,
    this.callback_url,
  });

  factory PaymentRegisterWithVerification.fromJson(Map<String, dynamic> parsedJson){

    return PaymentRegisterWithVerification(
        transaction_id:parsedJson['transaction_id'],
        payment_req:parsedJson['payment_req'],
        acs_url:parsedJson['acs_url'],
        callback_url:parsedJson['callback_url']
    );
  }
}

class PaymentRegisterWithoutVerification{
  String id;
  String user_uuid;
  String card_type;
  int card_suffix;

  PaymentRegisterWithoutVerification( {
    this.id,
    this.user_uuid,
    this.card_type,
    this.card_suffix,
  });

  factory PaymentRegisterWithoutVerification.fromJson(Map<String, dynamic> parsedJson){

    return PaymentRegisterWithoutVerification(
        id:parsedJson['id'],
        user_uuid:parsedJson['user_uuid'],
        card_type:parsedJson['card_type'],
        card_suffix:parsedJson['card_suffix']
    );
  }
}

