class RefreshData {
  RefreshData({
    this.clientId,
    this.token,
    this.clientUuid,
    this.refreshToken,
    this.refreshExpiration,
  });

  final int clientId;
  final String token;
  final String clientUuid;
  final String refreshToken;
  final double refreshExpiration;

  factory RefreshData.fromJson(Map<String, dynamic> json) => RefreshData(
    clientId: json["client_id"] == null ? null : json["client_id"],
    token: json["token"] == null ? null : json["token"],
    clientUuid: json["client_uuid"] == null ? null : json["client_uuid"],
    refreshToken: json["refresh_token"] == null ? null : json["refresh_token"],
    refreshExpiration: json["refresh_expiration"] == null ? null : json["refresh_expiration"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "client_id": clientId == null ? null : clientId,
    "token": token == null ? null : token,
    "client_uuid": clientUuid == null ? null : clientUuid,
    "refresh_token": refreshToken == null ? null : refreshToken,
    "refresh_expiration": refreshExpiration == null ? null : refreshExpiration,
  };
}
