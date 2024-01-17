class EmployeesResponse {
  final bool ok;
  final List<EmployeeResponse> employees;

  EmployeesResponse({
    required this.ok,
    required this.employees,
  });

  factory EmployeesResponse.fromJson(Map<String, dynamic> json) =>
      EmployeesResponse(
        ok: json["ok"],
        employees: List<EmployeeResponse>.from(
            json["employees"].map((x) => EmployeeResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
      };
}

class EmployeeResponse {
  final int pkiId;
  final String fcFirstname;
  final String fcFirstLastname;
  final String fcSecondLastname;
  final DateTime fdBirthday;
  final DateTime fdCreatedAt;
  final int fkiCreatedBy;
  final bool fiIsActive;

  EmployeeResponse({
    required this.pkiId,
    required this.fcFirstname,
    required this.fcFirstLastname,
    required this.fcSecondLastname,
    required this.fdBirthday,
    required this.fdCreatedAt,
    required this.fkiCreatedBy,
    required this.fiIsActive,
  });

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) =>
      EmployeeResponse(
        pkiId: json["pkiId"],
        fcFirstname: json["fcFirstname"],
        fcFirstLastname: json["fcFirstLastname"],
        fcSecondLastname: json["fcSecondLastname"],
        fdBirthday: DateTime.parse(json["fdBirthday"]),
        fdCreatedAt: DateTime.parse(json["fdCreatedAt"]),
        fkiCreatedBy: json["fkiCreatedBy"],
        fiIsActive: json["fiIsActive"],
      );

  Map<String, dynamic> toJson() => {
        "pkiId": pkiId,
        "fcFirstname": fcFirstname,
        "fcFirstLastname": fcFirstLastname,
        "fcSecondLastname": fcSecondLastname,
        "fdBirthday": fdBirthday.toIso8601String(),
        "fdCreatedAt": fdCreatedAt.toIso8601String(),
        "fkiCreatedBy": fkiCreatedBy,
        "fiIsActive": fiIsActive,
      };
}
