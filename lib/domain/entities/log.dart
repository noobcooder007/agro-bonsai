import 'package:agro_bonsai/domain/entities/employees.dart';

enum TypeOperation { insert, update, query, delete }

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
}
