import 'package:globout/util/exceptions/exceptions.dart';

String timeAgoSinceDate(String dateTime) {
  try {
    final datetime = DateTime.parse(dateTime);

    final date2 = DateTime.now();
    final difference = date2.difference(datetime);
    if (difference.inDays > 8) {
      return '${datetime.year}/${datetime.month}/${datetime.day}';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return '1 week ago';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return '1 day ago';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return '1 hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inMinutes >= 1) {
      return '1 min ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} secs ago';
    } else {
      return 'Just now';
    }
  } catch (e) {
    throw DateTimeFormatException();
  }
}
