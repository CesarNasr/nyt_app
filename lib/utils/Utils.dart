import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nytapp/models/Results.dart';

class Utils {
  String getFormattedDate(String dateString) {
    // iso date formatter
    var dateTime = DateTime.parse(dateString);
    return DateFormat('EEE, MMM d, ' 'hh:mm aaa').format(dateTime);
  }

  void goToScreen(BuildContext context, Widget widget) {
    // navigation to a given screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  List<Results> filterList(String query, List<Results> originalList) {
    var suggestionList = <Results>[];

    query
            .isEmpty // filtering the list based on the query entered by the user in the search box
        ? suggestionList = originalList
        : suggestionList.addAll(originalList.where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase())));

    return suggestionList;
  }
}
