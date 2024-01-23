// To parse this JSON data, do
//
//     final createEmployeeResponse = createEmployeeResponseFromJson(jsonString);

class CreateEmployeeResponse {
  final bool ok;
  final String? msg;

  CreateEmployeeResponse({
    required this.ok,
    this.msg,
  });

  factory CreateEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      CreateEmployeeResponse(
        ok: json["ok"],
        msg: json["msg"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "msg": msg,
      };
}
