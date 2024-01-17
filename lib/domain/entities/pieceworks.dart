import 'package:agro_bonsai/domain/entities/employees.dart';

enum TypePiecework { hours, piece, none }

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

  get fullName {
    return '${fkiEmployee.fcFirstname} ${fkiEmployee.fcFirstLastname} ${fkiEmployee.fcSecondLastname}';
  }
}
