// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:nytapp/di/DependencyService.dart';
import 'package:nytapp/models/ApiEntry.dart';
import 'package:nytapp/models/Results.dart';

import 'file:///C:/Users/CesarTech/Desktop/nyt_app/lib/ui/main.dart';
import 'package:nytapp/network/ApiService.dart';
import 'package:nytapp/repositories/ArticlesRepository.dart';
import 'package:nytapp/viewmodels/ArticlesViewModel.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // await tester.runAsync(() async {
    //    test code here
    // });
    // await GetIt.I.reset();
    // setupDependencies();
    //
    //
    // // Build our app and trigger a frame.
    // await tester.pumpWidget(MyApp());
    //
    //  await Future.delayed(const Duration(seconds: 5));
    //
    //
    // var articlesListViewModel =
    // dependencies<ArticlesViewModel>(); // viewmodel instance
    // var repository = dependencies<ArticlesRepository>(); // repository instamce
    // articlesListViewModel.repositoryService = repository;
    //
    // repository.apiService = ApiMock(false); //api mock instance
    // await articlesListViewModel.repositoryService.apiService.getRequest('').then((value) => {
    //
    //   // expect(find.byKey(Key('forwardKey')), findsOneWidget),
    //   tester.tap(find.byKey(Key('forwardKey')))
    //
    //
    // });
    //


  });
}

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




//
// class ApiServiceMock extends ApiService {
//
//   // get method to fetch api data
//   Future<dynamic> getRequest(String url) async {
//     var responseJson;
//     try {
//       final response = await http.get(url).timeout(const Duration(seconds: 15));
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw UnauthorisedException('Unauthorized');
//     } on TimeoutException {
//       throw FetchDataException('No Internet connection');
//     }
//
//     Map<String, dynamic> resp = responseJson;
//     return resp;
//   }
//
//
//   // fetching response status
//   dynamic _returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = json.decode(response.body.toString());
//         print(responseJson);
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 401:
//       case 403:
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//       default:
//         throw FetchDataException(
//             'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
//     }
//   }
// }
//
