import 'package:agro_bonsai/domain/entities/employees.dart';
import 'package:agro_bonsai/infrastructure/models/employees_response.dart';

class EmployeesMapper {
  static List<Employee> employeeResponseToEmployeeEntity(
      EmployeesResponse employeeResponse) {
    return employeeResponse.employees
        .map((employee) => Employee(
            pkiId: employee.pkiId,
            fcFirstname: employee.fcFirstname,
            fcFirstLastname: employee.fcFirstLastname,
            fcSecondLastname: employee.fcSecondLastname,
            fdBirthday: employee.fdBirthday,
            fdCreatedAt: employee.fdCreatedAt,
            fiIsActive: employee.fiIsActive))
        .toList();
  }
}
