import 'dart:convert';

OtpRequestModel otpRequestModelFromJson(String str) =>
    OtpRequestModel.fromJson(json.decode(str));

String otpRequestModelToJson(OtpRequestModel data) =>
    json.encode(data.toJson());

class OtpRequestModel {
  String message;
  Data data;

  OtpRequestModel({
    required this.message,
    required this.data,
  });

  OtpRequestModel copyWith({
    String? message,
    Data? data,
  }) =>
      OtpRequestModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory OtpRequestModel.fromJson(Map<String, dynamic> json) =>
      OtpRequestModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String pinId;
  String to;
  String smsStatus;

  Data({
    required this.pinId,
    required this.to,
    required this.smsStatus,
  });

  Data copyWith({
    String? pinId,
    String? to,
    String? smsStatus,
  }) =>
      Data(
        pinId: pinId ?? this.pinId,
        to: to ?? this.to,
        smsStatus: smsStatus ?? this.smsStatus,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pinId: json["pinId"],
        to: json["to"],
        smsStatus: json["smsStatus"],
      );

  Map<String, dynamic> toJson() => {
        "pinId": pinId,
        "to": to,
        "smsStatus": smsStatus,
      };
}
