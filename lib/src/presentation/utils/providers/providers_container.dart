import 'package:flutter_crud_test/src/domain_data/data/models/employee.dart';
import 'package:flutter_crud_test/src/domain_data/repositories/employee_repository.dart';
import 'package:flutter_crud_test/src/presentation/ui/pages/main_page/main_page_provider.dart';
import 'package:flutter_crud_test/src/presentation/ui/pages/single_employee/single_employee_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// app global Providers
///

/// Employee Providers
final employeeRepositoryProvider = Provider<EmployeeRepository>((ref) => EmployeeRepository());

final mainPageProvider = ChangeNotifierProvider<MainPageProvider>(
  (ref) => MainPageProvider(ref.read(employeeRepositoryProvider)),
);

final singleEmployeeProvider = ChangeNotifierProvider<SingleEmployeeProvider>(
  (ref) => SingleEmployeeProvider(ref.read(employeeRepositoryProvider), Employee()),
);
