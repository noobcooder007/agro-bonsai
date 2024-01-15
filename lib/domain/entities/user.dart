// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int pkiId;
  String fcUsername;
  String fcPassword;
  bool fiIsActive;
  DateTime fdCreatedAt;

  User({
    required this.pkiId,
    required this.fcUsername,
    required this.fcPassword,
    required this.fiIsActive,
    required this.fdCreatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        pkiId: json["pkiId"],
        fcUsername: json["fcUsername"],
        fcPassword: json["fcPassword"],
        fiIsActive: json["fiIsActive"],
        fdCreatedAt: DateTime.parse(json["fdCreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "pkiId": pkiId,
        "fcUsername": fcUsername,
        "fcPassword": fcPassword,
        "fiIsActive": fiIsActive,
        "fdCreatedAt":
            "${fdCreatedAt.year.toString().padLeft(4, '0')}-${fdCreatedAt.month.toString().padLeft(2, '0')}-${fdCreatedAt.day.toString().padLeft(2, '0')}",
      };
}
