import 'package:flutter_crud_test/src/domain_data/data/models/employee.dart';
import 'package:flutter_crud_test/src/domain_data/repositories/employee_repository.dart';
import 'package:flutter_crud_test/src/presentation/utils/providers/base_provider.dart';

class SingleEmployeeProvider extends BaseProvider {
  EmployeeRepository _repository;
  Employee employee;

  SingleEmployeeProvider(this._repository, this.employee);

  void setEmployee(Employee employee) {
    this.employee = employee;
  }

  Future save() async {
    loadBaseData(loadBody: () async {
      if (employee.id == null)
        await _repository.add(employee);
      else
        await _repository.update(item: employee);
    });
  }
}
