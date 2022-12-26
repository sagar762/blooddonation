// To parse this JSON data, do
//
//     final productModeL = productModeLFromJson(jsonString);

import 'dart:convert';

ProductModeL productModeLFromJson(String str) => ProductModeL.fromJson(json.decode(str));

String productModeLToJson(ProductModeL data) => json.encode(data.toJson());

class ProductModeL {
  ProductModeL({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.user,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;
  User? user;

  factory ProductModeL.fromJson(Map<String, dynamic> json) => ProductModeL(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "user": user?.toJson(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phoneNumber,
    this.location,
    this.bloodGroup,
  });

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? phoneNumber;
  String? location;
  String? bloodGroup;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    phoneNumber: json["phone_number"],
    location: json["location"],
    bloodGroup: json["blood_group"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "phone_number": phoneNumber,
    "location": location,
    "blood_group": bloodGroup,

  };

}
