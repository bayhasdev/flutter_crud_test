import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/utils/global_var.dart';
import '../../../../domain_data/data/models/phone_number_model.dart';
import '../../../config/themes/colors.dart';
import '../../../utils/extensions/extensions.dart';

class PhoneWidget extends StatefulWidget {
  final PhoneNumberModel? initValue;
  final bool isEnabled;
  final void Function(PhoneNumberModel phone) onChanged;
  final void Function(bool isValid)? onInputValidated;

  const PhoneWidget({this.initValue, required this.onChanged, this.onInputValidated, this.isEnabled = true});

  @override
  _PhoneWidgetState createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  PhoneNumberModel _phoneNumber = PhoneNumberModel();
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      initialValue: PhoneNumber(
        phoneNumber: widget.initValue?.phoneNumber,
        isoCode: widget.initValue?.isoCode,
        dialCode: widget.initValue?.dialCode,
      ),
      onInputValidated: (value) {
        GlobalVar.log(value.toString());
        if (widget.onInputValidated != null) {
          widget.onInputValidated!(value);
        }
      },
      locale: 'ar',
      hintText: str.formAndAction.phone,
      isEnabled: widget.isEnabled,
      selectorTextStyle: context.textTheme.bodyLarge?.copyWith(
        height: 2.5,
        fontSize: 17,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      searchBoxDecoration: InputDecoration(labelText: str.main.search),
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
        trailingSpace: false,
      ),
      spaceBetweenSelectorAndTextField: 4,
      errorMessage: str.msg.invalidPhoneNumber,
      inputDecoration: InputDecoration(
        labelText: str.formAndAction.phone,
        labelStyle: context.textTheme.labelMedium?.copyWith(color: Colors.grey.shade900, fontSize: 13, height: 0.8),
        contentPadding: const EdgeInsets.only(bottom: 13, right: 8, top: 4, left: 4),
        focusColor: kPrimaryColor,
      ),
      onInputChanged: (PhoneNumber value) {
        _phoneNumber = PhoneNumberModel(
          phoneNumber: value.phoneNumber,
          isoCode: value.isoCode,
          dialCode: value.dialCode,
        );
        widget.onChanged(_phoneNumber);
      },
    );
  }
}
