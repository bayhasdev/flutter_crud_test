import '../../../core/utils/global_var.dart';

extension Formatting on double {
  String dynamicDecimalPoint({int fractionDigits = 2}) {
    if (this - toInt() > 0) {
      return toStringAsFixed(fractionDigits);
    }
    return toStringAsFixed(0);
  }

  String? parseWeekDays() {
    String text;
    switch (toInt()) {
      case 0:
        text = str.dateTime.monday;
        break;
      case 1:
        text = str.dateTime.tuesday;
        break;
      case 2:
        text = str.dateTime.wednesday;
        break;
      case 3:
        text = str.dateTime.thursday;
        break;
      case 4:
        text = str.dateTime.friday;
        break;
      case 5:
        text = str.dateTime.saturday;
        break;
      case 6:
        text = str.dateTime.sunday;
        break;
      default:
        text = '';
        break;
    }
    return text;
  }
}

extension Parsing on int {
  String? parseWeekDays() {
    String text;
    switch (toInt()) {
      case 1:
        text = str.dateTime.monday;
        break;
      case 2:
        text = str.dateTime.tuesday;
        break;
      case 3:
        text = str.dateTime.wednesday;
        break;
      case 4:
        text = str.dateTime.thursday;
        break;
      case 5:
        text = str.dateTime.friday;
        break;
      case 6:
        text = str.dateTime.saturday;
        break;
      case 7:
        text = str.dateTime.sunday;
        break;
      default:
        text = '';
        break;
    }
    return text;
  }

  String parseMonths() {
    switch (toInt()) {
      case 1:
        return str.dateTime.january;
      case 2:
        return str.dateTime.february;
      case 3:
        return str.dateTime.march;
      case 4:
        return str.dateTime.april;
      case 5:
        return str.dateTime.may;
      case 6:
        return str.dateTime.june;
      case 7:
        return str.dateTime.july;
      case 8:
        return str.dateTime.august;
      case 9:
        return str.dateTime.september;
      case 10:
        return str.dateTime.october;
      case 11:
        return str.dateTime.november;
      case 12:
        return str.dateTime.december;
      default:
        return '';
    }
  }
}
