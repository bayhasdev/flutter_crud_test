import 'package:intl/intl.dart';

import '../../../core/constants/constants.dart';

extension Format on DateTime {
  String? dateForamt({String foramt = kDateFormat}) => DateFormat(foramt).format(toLocal());
}

extension Transform on DateTime {
  DateTime get resetTime => DateTime(year, month, day);
}

extension FormatDuration on Duration {
  String format() {
    var microseconds = inMicroseconds;

    var hours = microseconds ~/ Duration.microsecondsPerHour;
    microseconds = microseconds.remainder(Duration.microsecondsPerHour);

    if (microseconds < 0) microseconds = -microseconds;

    var minutes = microseconds ~/ Duration.microsecondsPerMinute;
    var minutesString = minutes < 10 ? '0$minutes' : '$minutes';

    return "$hours:"
        "$minutesString";
  }
}
