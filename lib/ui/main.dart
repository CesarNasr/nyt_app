import 'package:flutter/material.dart';
import 'package:nytapp/ui/screens/ArticlesScreen.dart';
import 'package:nytapp/utils/Strings.dart';
import 'package:nytapp/viewmodels/ArticlesViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ArticlesViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: Strings.appTitle),
      ),
    );
  }
}
