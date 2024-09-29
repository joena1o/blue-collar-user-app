// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  Profile profile;
  String id;
  String email;
  String firstName;
  String lastName;
  String password;
  String picture;
  String referralCode;
  String privileges;
  bool emailVerified;
  bool phoneNumber;
  int v;

  UserModel({
    required this.profile,
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.picture,
    required this.referralCode,
    required this.privileges,
    required this.emailVerified,
    required this.phoneNumber,
    required this.v,
  });

  UserModel copyWith({
    Profile? profile,
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    String? picture,
    String? referralCode,
    String? privileges,
    bool? emailVerified,
    bool? phoneNumber,
    int? v,
  }) =>
      UserModel(
        profile: profile ?? this.profile,
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        picture: picture ?? this.picture,
        referralCode: referralCode ?? this.referralCode,
        privileges: privileges ?? this.privileges,
        emailVerified: emailVerified ?? this.emailVerified,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        v: v ?? this.v,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        profile: Profile.fromJson(json["profile"]),
        id: json["_id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        picture: json["picture"],
        referralCode: json["referralCode"],
        privileges: json["privileges"],
        emailVerified: json["emailVerified"],
        phoneNumber: json["phoneNumber"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile.toJson(),
        "_id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "picture": picture,
        "referralCode": referralCode,
        "privileges": privileges,
        "emailVerified": emailVerified,
        "phoneNumber": phoneNumber,
        "__v": v,
      };
}

class Profile {
  dynamic address;
  dynamic dateOfBirth;
  dynamic bio;
  dynamic phone;

  Profile({
    required this.address,
    required this.dateOfBirth,
    required this.bio,
    required this.phone,
  });

  Profile copyWith({
    dynamic address,
    dynamic dateOfBirth,
    dynamic bio,
    dynamic phone,
  }) =>
      Profile(
        address: address ?? this.address,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        bio: bio ?? this.bio,
        phone: phone ?? this.phone,
      );

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        address: json["address"],
        dateOfBirth: json["dateOfBirth"],
        bio: json["bio"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "dateOfBirth": dateOfBirth,
        "bio": bio,
        "phone": phone,
      };
}
