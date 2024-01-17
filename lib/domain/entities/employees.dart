class Employee {
  final int? pkiId;
  final String fcFirstname;
  final String fcFirstLastname;
  final String fcSecondLastname;
  final DateTime fdBirthday;
  final DateTime fdCreatedAt;
  final bool fiIsActive;

  Employee({
    required this.pkiId,
    required this.fcFirstname,
    required this.fcFirstLastname,
    required this.fcSecondLastname,
    required this.fdBirthday,
    required this.fdCreatedAt,
    required this.fiIsActive,
  });

  get fullName {
    return '$fcFirstname $fcFirstLastname $fcSecondLastname';
  }
}
