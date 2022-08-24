import 'package:flutter/material.dart';
import 'package:flutter_crud_test/src/core/constants/app_constant.dart';
import 'package:flutter_crud_test/src/core/utils/global_var.dart';
import 'package:flutter_crud_test/src/core/utils/validation.dart';
import 'package:flutter_crud_test/src/presentation/config/themes/app_theme.dart';
import 'package:flutter_crud_test/src/presentation/ui/pages/single_employee/single_employee_provider.dart';
import 'package:flutter_crud_test/src/presentation/ui/ui_component/custom_widget/button.dart';
import 'package:flutter_crud_test/src/presentation/ui/ui_component/custom_widget/messages.dart';
import 'package:flutter_crud_test/src/presentation/ui/ui_component/custom_widget/phone_widget.dart';
import 'package:flutter_crud_test/src/presentation/utils/providers/providers_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../utils/extensions/extensions.dart';

class SingleEmployeePage extends ConsumerStatefulWidget {
  static const String routeName = '/SingleEmployeePage';
  @override
  _SingleEmployeePageState createState() => _SingleEmployeePageState();
}

class _SingleEmployeePageState extends ConsumerState<SingleEmployeePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late SingleEmployeeProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = ref.watch(singleEmployeeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Employee'),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _name(),
              const SizedBox(height: 24),
              _phone(),
              const SizedBox(height: 24),
              _saveBTN(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _name() {
    return TextFormField(
      initialValue: provider.employee.name,
      decoration: AppTheme.getDefultTextFieldDecoration(lable: str.formAndAction.name),
      validator: (val) => ValidationUtil.stringLengthValidation(val, str.msg.pleaseAddFullName),
      onChanged: (val) => provider.employee.name = val.trim(),
    );
  }

  Widget _phone() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PhoneWidget(
        initValue: PhoneNumber(
          phoneNumber: provider.employee.phone,
          isoCode: kCountriesCode[provider.employee.countryCode],
          dialCode: provider.employee.countryCode,
        ),
        onChanged: (phone) {
          provider.employee.phone = phone.phoneNumber;
          provider.employee.countryCode = phone.dialCode;
        },
      ),
    );
  }

  Widget _saveBTN() {
    return ButtonWidget(
      text: str.formAndAction.save,
      onPressed: () => saveFun(),
      margin: EdgeInsets.zero,
    );
  }

  void saveFun() async {
    try {
      if (formKey.currentState!.validate()) {
        await provider.save();
        if (!mounted) return;
        context.showSnakBar(str.msg.saveSucceeded);
        context.pop();
      }
    } catch (err) {
      showDialog(context: context, builder: (context) => CustomDialog(message: err.toString()));
    }
  }
}
