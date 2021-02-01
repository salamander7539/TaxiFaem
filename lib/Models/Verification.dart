import 'dart:convert';

class VerificationData {
  VerificationData({
    this.driverId,
    this.token,
    this.driverUuid,
    this.refreshToken,
    this.refreshExpiration,
  });

  final int driverId;
  final String token;
  final String driverUuid;
  final String refreshToken;
  final int refreshExpiration;

  factory VerificationData.fromJson(Map<String, dynamic> json) => VerificationData(
    driverId: json["driver_id"],
    token: json["token"],
    driverUuid: json["driver_uuid"],
    refreshToken: json["refresh_token"],
    refreshExpiration: json["refresh_expiration"],
  );

  Map<String, dynamic> toJson() => {
    "driver_id": driverId,
    "token": token,
    "driver_uuid": driverUuid,
    "refresh_token": refreshToken,
    "refresh_expiration": refreshExpiration,
  };
}
