import 'package:intl/intl.dart';

class DateHelper {
  static String changeFormatIdToDateTimeFormat(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}