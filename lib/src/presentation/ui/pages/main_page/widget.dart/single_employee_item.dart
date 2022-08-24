import 'package:flutter/material.dart';
import 'package:flutter_crud_test/src/core/utils/global_var.dart';
import 'package:flutter_crud_test/src/domain_data/data/models/employee.dart';
import 'package:flutter_crud_test/src/presentation/ui/pages/single_employee/single_employee_page.dart';
import 'package:flutter_crud_test/src/presentation/ui/ui_component/custom_widget/messages.dart';
import 'package:flutter_crud_test/src/presentation/utils/providers/providers_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/extensions/extensions.dart';

class SingleEmployeeItem extends StatelessWidget {
  final Employee item;
  const SingleEmployeeItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Card(
          child: InkWell(
            onTap: () async {
              ref.read(singleEmployeeProvider.notifier).setEmployee(item);
              await context.pushNamed(SingleEmployeePage.routeName);
              ref.read(mainPageProvider.notifier).getDate();
            },
            child: ListTile(
              title: Text(item.name ?? ''),
              subtitle: Text(
                item.phone ?? '',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.right,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  _deleteFun(context, ref);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _deleteFun(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => CustomConfirmationDialog(
        message: str.msg.deleteConfermation,
        yesBTNCallBack: () async {
          context.pop();
          try {
            ref.read(mainPageProvider.notifier).delete(item);
          } catch (err) {
            showDialog(context: context, builder: (context) => CustomDialog(message: err.toString()));
          }
        },
      ),
    );
  }
}
