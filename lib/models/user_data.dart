// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.tokenType,
    this.iat,
    this.expiresIn,
    this.jwtToken,
  });

  String? tokenType;
  int? iat;
  int? expiresIn;
  String? jwtToken;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    tokenType: json["token_type"],
    iat: json["iat"],
    expiresIn: json["expires_in"],
    jwtToken: json["jwt_token"],
  );

  Map<String, dynamic> toJson() => {
    "token_type": tokenType,
    "iat": iat,
    "expires_in": expiresIn,
    "jwt_token": jwtToken,
  };
}
