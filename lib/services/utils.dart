import 'package:intl/intl.dart';

String formatTimestamp(DateTime? dateTime) {
  if (dateTime != null) {
    String formattedDate = DateFormat('E, dd MMM yyyy').format(dateTime);
    String formattedTime = DateFormat('HH:mm').format(dateTime);

    // Combine the components and add 'GMT'
    return '$formattedDate $formattedTime GMT';
  } else {
    return "Not Available";
  }
}
