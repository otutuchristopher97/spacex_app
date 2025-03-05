import 'package:intl/intl.dart';

String formatDate(String dateUtc) {
  try {
    DateTime dateTime = DateTime.parse(dateUtc);
    return DateFormat('MMMM dd, yyyy – HH:mm a').format(dateTime.toUtc());
  } catch (e) {
    return 'Invalid Date';
  }
}
