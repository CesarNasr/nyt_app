import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nytapp/ui/screens/DetailsScreen.dart';
import 'package:nytapp/ui/widgets/ArticleListItem.dart';
import 'package:nytapp/ui/widgets/ErrorWidgetView.dart';
import 'package:nytapp/utils/CustomSearchDelegate.dart';
import 'package:nytapp/utils/Utils.dart';
import 'package:nytapp/viewmodels/ArticlesViewModel.dart';
import 'package:provider/provider.dart' if (dart.library.io) 'package:provider/provider.dart';

// screen that shows list retrieved from api

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(context),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: Provider.of<ArticlesViewModel>(context,
                  listen: false) // getting instance of provider
              .getApiResults(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (dataSnapshot.error != null) {
                return Center(
                  child: ErrorWidgetView(() {
                    setState(() {});
                  }),
                );
              } else {
                return Consumer<ArticlesViewModel>(
                  // consumer widget to be able to listen to changes on the provider level
                  builder: (ctx, data, child) => ListView.builder(
                    itemCount: data.apiEntry.results.length,
                    itemBuilder: (ctx, i) =>
                        ArticleListItem(data.apiEntry.results[i], () {
                      Utils().goToScreen(
                          context, DetailsScreen(data.apiEntry.results[i]));
                    }),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(widget.title);
  }
}
