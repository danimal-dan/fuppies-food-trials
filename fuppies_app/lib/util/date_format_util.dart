import 'package:intl/intl.dart';

DateFormat defaultDateTimeFormat = DateFormat('yyyy-MM-dd hh:mm a');
DateFormat defaultTimeFormat = DateFormat('hh:mm a');

String prettyPrintDateTime(DateTime? dateTime) {
  if (dateTime == null) {
    return "";
  }

  DateTime dateCopy = DateTime(dateTime.year, dateTime.month, dateTime.day);

  DateTime now = DateTime.now();
  DateTime nowCopy = DateTime(now.year, now.month, now.day);

  int diffInDays = dateCopy.difference(nowCopy).inDays;

  if (diffInDays == 0) {
    return "Today, ${defaultTimeFormat.format(dateTime)}";
  } else if (diffInDays == -1) {
    return "Yesterday, ${defaultTimeFormat.format(dateTime)}";
  } else if (diffInDays == 1) {
    return "Tomorrow, ${defaultTimeFormat.format(dateTime)}";
  }

  return defaultDateTimeFormat.format(dateTime);
}
