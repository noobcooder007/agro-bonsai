class Employee {
  final int? pkiId;
  final String fcFirstname;
  final String fcFirstLastname;
  final String fcSecondLastname;
  final DateTime fdBirthday;
  final DateTime? fdCreatedAt;
  final bool fiIsActive;

  Employee({
    this.pkiId,
    required this.fcFirstname,
    required this.fcFirstLastname,
    required this.fcSecondLastname,
    required this.fdBirthday,
    this.fdCreatedAt,
    required this.fiIsActive,
  });

  String getFullName() {
    return '$fcFirstname $fcFirstLastname $fcSecondLastname';
  }
}
