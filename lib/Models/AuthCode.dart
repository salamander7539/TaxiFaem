class AuthCodeData {
  int client_id;
  String token;
  String client_uuid;
  String refresh_token;
  int next_request_time;

  AuthCodeData( {
    this.client_id,
    this.token,
    this.client_uuid,
    this.refresh_token,
    this.next_request_time
  });

  factory AuthCodeData.fromJson(Map<String, dynamic> parsedJson){

    return AuthCodeData(
        client_id:parsedJson['client_id'],
        token:parsedJson['token'],
        client_uuid:parsedJson['client_uuid'],
        refresh_token:parsedJson['refresh_token'],
        next_request_time:parsedJson['next_request_time']
    );
  }
}