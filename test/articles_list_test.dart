import 'package:nytapp/di/DependencyService.dart';
import 'package:nytapp/models/ApiEntry.dart';
import 'package:nytapp/models/Results.dart';
import 'package:nytapp/network/ApiService.dart';
import 'package:nytapp/repositories/ArticlesRepository.dart';
import 'package:nytapp/viewmodels/ArticlesViewModel.dart';
import 'package:flutter_test/flutter_test.dart';

class ApiMock extends ApiService {
  @override
  Future<dynamic> getRequest(String url) {
    ApiEntry _apiEntry;

    var response = ApiEntry(
      status: 'OK',
      copyright: 'etc',
      numResults: 10,
      results: resultsMock,
    );

    _apiEntry = response;

   return Future.value(_apiEntry);
  }
}

final resultsMock = [
  Results(title: 'title 1', uri: 'resultUri', url: 'url', assetId: 1),
  Results(title: 'title 2', uri: 'resultUri', url: 'url', assetId: 2),
  Results(title: 'title 3', uri: 'resultUri', url: 'url', assetId: 3)
];

void main() {
  setupDependencies();

  var articlesListViewModel =
      dependencies<ArticlesViewModel>(); // viewmodel instance

  var repository = dependencies<ArticlesRepository>(); // repository instamce
  repository.apiService = ApiMock(); //api mock instance

  articlesListViewModel.repositoryService = repository;

  group('Given Article List Page Loads', () {
    test('Page should load a list of Articles from API', () async {
     var apiEntry = await articlesListViewModel.repositoryService.apiService.getRequest('');

      expect(apiEntry.results.length, 3);
      expect(apiEntry.results[0].title, 'title 1');
      expect(apiEntry.results[0].assetId, 1);
      expect(apiEntry.results[1].title, 'title 2');
      expect(apiEntry.results[1].url, 'url');
    });
  });
}
