import 'package:flutter/material.dart';
import 'package:nytapp/utils/Strings.dart';

class ErrorWidgetView extends StatefulWidget {
  final Function onRetry;
  //callback function to the  parent view when button is pressed

  ErrorWidgetView(this.onRetry);

  @override
  _ErrorWidgetViewState createState() => _ErrorWidgetViewState();
}

class _ErrorWidgetViewState extends State<ErrorWidgetView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => {widget.onRetry()},
        child: Column(
          children: [Text(Strings.tapToRetry), Icon(Icons.all_inclusive)],
        ),
      ),
    );
  }
}
