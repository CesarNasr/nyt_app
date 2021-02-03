import 'package:flutter/material.dart';
import 'package:nytapp/models/Results.dart';
import 'package:nytapp/ui/screens/DetailsScreen.dart';
import 'package:nytapp/ui/widgets/ArticleListItem.dart';
import 'package:nytapp/viewmodels/ArticlesViewModel.dart';
import 'package:provider/provider.dart';

import 'Utils.dart';

class CustomSearchDelegate extends SearchDelegate {
  String selectedResult;

  List<Results> _list = [];

  CustomSearchDelegate(BuildContext context) {
    var articlesProvider = Provider.of<ArticlesViewModel>(context, listen: false); // fetching list to search from the provider class (or viewmodel)
    _list = articlesProvider.apiEntry.results;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestionList = <Results>[];

    query.isEmpty // filtering the list based on the query entered by the user in the search box
        ? suggestionList = _list
        : suggestionList
        .addAll(_list.where((element) => element.title.toLowerCase().contains(query.toLowerCase())));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (_, i) {
        return ArticleListItem(suggestionList[i], () {
          Utils().goToScreen(
              context, DetailsScreen(suggestionList[i]));
        });
      },
    );
  }
}
