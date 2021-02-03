import 'package:flutter/cupertino.dart';
import 'package:nytapp/di/DependencyService.dart';
import 'package:nytapp/models/ApiEntry.dart';
import 'package:nytapp/models/Results.dart';
import 'package:nytapp/network/ApiExceptions.dart';
import 'package:nytapp/repositories/ArticlesRepository.dart';

class ArticlesViewModel with ChangeNotifier { // provider class related to the UI screen, plays the role of the viewmodel
//  ArticlesRepository _articlesRepository = ArticlesRepository(); // use DI
  var repositoryService = dependencies<ArticlesRepository>();

  ApiEntry _apiEntry;
  List<Results> _results = [];

  ApiEntry get apiEntry => _apiEntry;

  set apiEntry(ApiEntry value) {
    _apiEntry = value;
  }

  List<Results> get results => _results;

  set results(List<Results> value) {
    _results = value;
  }

  Future<void> getApiResults() async {
    ApiEntry apiResult = await repositoryService.fetchArticlesResponse();
     if (apiResult.status == 'OK') {
      _apiEntry = apiResult;
      notifyListeners();

    } else {
      throw UnauthorisedException('Authorization Error');
    }
  }
}
