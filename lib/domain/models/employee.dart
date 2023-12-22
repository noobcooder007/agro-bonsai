// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  int pkiId;
  String fcFirstName;
  String fcFirstLastName;
  String fcSecondLastName;
  String fdBirthday;
  String fdCreatedAt;
  bool fiIsActive;

  Employee({
    required this.pkiId,
    required this.fcFirstName,
    required this.fcFirstLastName,
    required this.fcSecondLastName,
    required this.fdBirthday,
    required this.fdCreatedAt,
    required this.fiIsActive,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        pkiId: json["pkiId"],
        fcFirstName: json["fcFirstName"],
        fcFirstLastName: json["fcFirstLastName"],
        fcSecondLastName: json["fcSecondLastName"],
        fdBirthday: json["fdBirthday"],
        fdCreatedAt: json["fdCreatedAt"],
        fiIsActive: json["fiIsActive"],
      );

  Map<String, dynamic> toJson() => {
        "pkiId": pkiId,
        "fcFirstName": fcFirstName,
        "fcFirstLastName": fcFirstLastName,
        "fcSecondLastName": fcSecondLastName,
        "fdBirthday": fdBirthday,
        "fdCreatedAt": fdCreatedAt,
        "fiIsActive": fiIsActive,
      };
}
