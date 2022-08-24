import 'package:flutter_crud_test/src/domain_data/data/models/employee.dart';
import 'package:flutter_crud_test/src/domain_data/data_sources/local/local_database/employee_dto.dart';

class EmployeeRepository {
  EmployeeDto employeeDto = EmployeeDto();

  Future<Employee?> getSingle({int? id}) async {
    Map<String, dynamic>? res = await employeeDto.getSingle(id: id);
    if (res != null) return Employee.fromMap(res);
    return null;
  }

  Future<List<Employee>> getAccounts({String? name}) async {
    List<Map<String, dynamic>> res = await employeeDto.getAccounts(name: name);
    return res.isNotEmpty ? res.map((c) => Employee.fromMap(c)).toList() : [];
  }

  Future<int?> add(Employee item) async {
    item.createDate = DateTime.now().toIso8601String();
    return await employeeDto.insert(item.toMap());
  }

  Future update({required Employee item}) async {
    await employeeDto.update(item.toMap(), item.id ?? 0);
  }

  Future<int> delete(Employee item) async {
    return await employeeDto.delete(item.id ?? 0);
  }
}
