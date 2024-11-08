import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? username;
  dynamic emailVerifiedAt;
  int? verified;
  String? profilePicture;
  String? ktp;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? balance;
  String? cardNumber;
  String? pin;
  String? token;
  int? tokenExpiresIn;
  String? tokenType;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.username,
    this.emailVerifiedAt,
    this.verified,
    this.profilePicture,
    this.ktp,
    this.createdAt,
    this.updatedAt,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
    this.tokenExpiresIn,
    this.tokenType,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? username,
    String? pin,
    int? balance,
  }) =>
      UserModel(
        id: id ,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        username: username ?? this.username,
        emailVerifiedAt: emailVerifiedAt,
        verified: verified,
        profilePicture: profilePicture,
        ktp: ktp ,
        createdAt: createdAt ,
        updatedAt: updatedAt ,
        balance: balance ?? this.balance,
        cardNumber: cardNumber ,
        pin: pin ?? this.pin,
        token: token,
        tokenExpiresIn: tokenExpiresIn,
        tokenType: tokenType,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        username: json["username"],
        emailVerifiedAt: json["email_verified_at"],
        verified: json["verified"],
        profilePicture: json["profile_picture"],
        ktp: json["ktp"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        balance: json["balance"],
        cardNumber: json["card_number"],
        pin: json["pin"],
        token: json["token"],
        tokenExpiresIn: json["token_expires_in"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "username": username,
        "email_verified_at": emailVerifiedAt,
        "verified": verified,
        "profile_picture": profilePicture,
        "ktp": ktp,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "balance": balance,
        "card_number": cardNumber,
        "pin": pin,
        "token": token,
        "token_expires_in": tokenExpiresIn,
        "token_type": tokenType,
      };
}
