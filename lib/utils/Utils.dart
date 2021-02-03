import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Utils {
  String getFormattedDate(String dateString) {
    // iso date formatter
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('EEE, MMM d, ' 'hh:mm aaa').format(dateTime);
  }

  void goToScreen(BuildContext context, Widget widget) {
    // navigation to a given screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
