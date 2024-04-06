import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  DateTime addYMD({int y = 0, int m = 0, int d = 0}) {
    return DateTime(year + y, month + m, day + d);
  }

  DateTime get removeHMS => addYMD();
  String toFormat({String format = 'dd MMM yyyy'}) =>
      DateFormat(format).format(this);
}
