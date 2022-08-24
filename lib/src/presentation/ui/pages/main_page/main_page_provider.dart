import 'package:flutter_crud_test/src/core/utils/global_var.dart';
import 'package:flutter_crud_test/src/domain_data/data/models/employee.dart';
import 'package:flutter_crud_test/src/domain_data/repositories/employee_repository.dart';
import '../../../utils/providers/base_provider.dart';

class MainPageProvider extends BaseProvider<Employee> {
  EmployeeRepository _repository;

  MainPageProvider(this._repository) {
    GlobalVar.log('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    getDate();
  }

  Future getDate() async {
    loadBaseData(loadBody: () async {
      dataList = await _repository.getAccounts();
    });
  }

  Future delete(Employee employee) async {
    loadBaseData(loadBody: () async {
      var res = await _repository.delete(employee);
      if (res > 0) getDate();
    });
  }
}
