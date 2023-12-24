// To parse this JSON data, do
//
//     final piecework = pieceworkFromJson(jsonString);

import 'dart:convert';

import 'package:agro_bonsai/domain/models/employee.dart';

enum TypePiecework { hours, piece, none }

Piecework pieceworkFromJson(String str) => Piecework.fromJson(json.decode(str));

String pieceworkToJson(Piecework data) => json.encode(data.toJson());

class Piecework {
  int? pkiId;
  Employee fkiEmployee;
  TypePiecework fcTypePiecework;
  int? fiQuantity;
  DateTime fdCreatedAt;
  bool fiIsActive;

  Piecework({
    required this.pkiId,
    required this.fkiEmployee,
    required this.fcTypePiecework,
    required this.fiQuantity,
    required this.fdCreatedAt,
    required this.fiIsActive,
  });

  factory Piecework.fromJson(Map<String, dynamic> json) => Piecework(
        pkiId: json["pkiId"],
        fkiEmployee: json["fkiEmployee"],
        fcTypePiecework: json["fcTypePiecework"],
        fiQuantity: json["fiQuantity"],
        fdCreatedAt: json["fdCreatedAt"],
        fiIsActive: json["fiIsActive"],
      );

  Map<String, dynamic> toJson() => {
        "pkiId": pkiId,
        "fkiEmployee": fkiEmployee,
        "fcTypePiecework": fcTypePiecework,
        "fiQuantity": fiQuantity,
        "fdCreatedAt": fdCreatedAt,
        "fiIsActive": fiIsActive,
      };

  String get fullName {
    return '${fkiEmployee.fcFirstName} ${fkiEmployee.fcFirstLastName} ${fkiEmployee.fcSecondLastName}';
  }
}
