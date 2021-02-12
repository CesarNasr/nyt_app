import 'package:flutter/cupertino.dart';
import 'package:nytapp/di/DependencyService.dart';
import 'package:nytapp/models/ApiEntry.dart';
import 'package:nytapp/models/Results.dart';
import 'package:nytapp/network/ApiService.dart';
import 'package:nytapp/repositories/ArticlesRepository.dart';
import 'package:nytapp/utils/Utils.dart';
import 'package:nytapp/viewmodels/ArticlesViewModel.dart';
import 'package:flutter_test/flutter_test.dart';

// Unit tests included :
//1. API Success Call
//2. API Failure Call (exception due to internet failure)
//3. Date formatter fun test
//4. Search bar filter algorithm test

class ApiMock extends ApiService {
  bool noInternet;

  ApiMock(this.noInternet);

  @override
  Future<dynamic> getRequest(String url) {
    if (noInternet) {
      throw Exception('Exception');
    }
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
  articlesListViewModel.repositoryService = repository;

  var utils = Utils();

  group('Given Article List Page Loads', () {
    // api success response
    test('Page should load a list of Articles from API', () async {
      repository.apiService = ApiMock(false); //api mock instance

      var apiEntry = await articlesListViewModel.repositoryService.apiService
          .getRequest('');
      expect(apiEntry.results.length, 3);
      expect(apiEntry.results[0].title, 'title 1');
      expect(apiEntry.results[0].assetId, 1);
      expect(apiEntry.results[1].title, 'title 2');
      expect(apiEntry.results[1].url, 'url');
    });

    // when snapshot returns error for internet connection, the getRequest() function must throw an error
    test('Page should throw no internet exception', () async {
      repository.apiService = ApiMock(true); //api mock instance
      try {
        var apiEntry = await articlesListViewModel.repositoryService.apiService
            .getRequest('');
      } on Exception catch (e) {
        expect(e.toString(), 'Exception: Exception');
      }
    });

    // date formatter test
    test('Date format output test', () {
      var testDate = '2021-02-05';
      var expectedDate = 'Fri, Feb 5, 12:00 AM';
      var outputDate = utils.getFormattedDate(testDate);
      expect(outputDate, expectedDate);
    });

    // filter query in search bar
    test('Search filter results do exist', () {
      var results = utils.filterList('title', resultsMock);
      expect(results[0].title, 'title 1');
      expect(results[1].title, 'title 2');
      expect(results[2].title, 'title 3');
    });

    // filter query that doesnt exist
    test('Search filter results do not exist', () {
      var results = utils.filterList('testing 321', resultsMock);
      expect(results.length, 0);
      // expect(results[1].title, 'title 2');
      // expect(results[2].title, 'title 3');
    });
  });
}
