import 'package:intl/intl.dart';

String formatDate(String dateStr) {
  DateFormat inputFormat = DateFormat('dd / MM / yyyy');
  DateTime date = inputFormat.parse(dateStr);

  DateFormat outputFormat = DateFormat('dd MMM yyyy');
  return outputFormat.format(date);
}
