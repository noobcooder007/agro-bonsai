// To parse this JSON data, do
//
//     final log = logFromJson(jsonString);

import 'dart:convert';

import 'package:agro_bonsai/domain/entities/employee.dart';

enum TypeOperation { insert, update, query, delete }

Log logFromJson(String str) => Log.fromJson(json.decode(str));

String logToJson(Log data) => json.encode(data.toJson());

class Log {
  int pkiId;
  TypeOperation fcTypeOperation;
  String fcDescription;
  Employee fkiEmployee;
  DateTime fdCreatedAt;
  bool fiIsActive;

  Log({
    required this.pkiId,
    required this.fcTypeOperation,
    required this.fcDescription,
    required this.fkiEmployee,
    required this.fdCreatedAt,
    required this.fiIsActive,
  });

  factory Log.fromJson(Map<String, dynamic> json) => Log(
        pkiId: json["pkiId"],
        fcTypeOperation: json["fcTypeOperation"],
        fcDescription: json["fcDescription"],
        fkiEmployee: json["fkiEmployee"],
        fdCreatedAt: json["fdCreatedAt"],
        fiIsActive: json["fiIsActive"],
      );

  Map<String, dynamic> toJson() => {
        "pkiId": pkiId,
        "fcTypeOperation": fcTypeOperation,
        "fcDescription": fcDescription,
        "fkiEmployee": fkiEmployee,
        "fdCreatedAt": fdCreatedAt,
        "fiIsActive": fiIsActive,
      };
}
