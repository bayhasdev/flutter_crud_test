import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../../../generated/locale_base.dart';

late LocaleBase str;

class GlobalVar {
  ////////////{ Methods}

  static bool checkString(String? string) => string != null && string.isNotEmpty;

  static String numToString(dynamic value, [String defultValue = '0']) => value != null ? value.toString() : defultValue;
  static String doubleToString(dynamic value, [String defultValue = '0.0']) => value != null ? value.toStringAsFixed(2) : defultValue;

  static String currencyForamt(num amount, {String currencySymbol = '', int decimalCount = 2}) {
    final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: decimalCount, locale: 'EN', name: currencySymbol);
    return formatCurrency.format(amount);
  }

  static DateTime dateResetClock({DateTime? date}) {
    date ??= DateTime.now();
    return DateTime(date.year, date.month, date.day);
  }

  static dynamic getFirstListItem(List list) => checkListNotEmpty(list) ? list.first : null;

  static bool checkListNotEmpty(List? list) => list != null && list.isNotEmpty;

  static void log(String message) {
    if (kDebugMode) {
      developer.log(message);
    }
  }
}
