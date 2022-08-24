import 'package:flutter/material.dart';
import 'package:flutter_crud_test/src/domain_data/data/models/employee.dart';
import 'package:flutter_crud_test/src/presentation/ui/pages/main_page/widget.dart/single_employee_item.dart';
import 'package:flutter_crud_test/src/presentation/ui/pages/single_employee/single_employee_page.dart';
import 'package:flutter_crud_test/src/presentation/utils/providers/providers_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_page_provider.dart';
import '../../../utils/extensions/extensions.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String routeName = '/MainPage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  late MainPageProvider provider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = ref.watch(mainPageProvider);
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
      floatingActionButton: _addBtn(),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text('Employee Crud'),
    );
  }

  ListView _body() {
    return ListView(
      children: provider.dataList
          .map(
            (e) => SingleEmployeeItem(e),
          )
          .toList(),
    );
  }

  Widget _addBtn() {
    return FloatingActionButton(
      onPressed: () async {
        ref.read(singleEmployeeProvider.notifier).setEmployee(Employee());
        await context.pushNamed(SingleEmployeePage.routeName);
        ref.read(mainPageProvider.notifier).getDate();
      },
      child: const Icon(Icons.add),
    );
  }
}
