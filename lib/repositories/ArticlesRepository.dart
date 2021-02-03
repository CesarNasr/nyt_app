import 'package:nytapp/di/DependencyService.dart';
import 'package:nytapp/models/ApiEntry.dart';
import 'package:nytapp/network/ApiConstants.dart';
import 'package:nytapp/network/ApiExceptions.dart';
import 'package:nytapp/network/ApiService.dart';

class ArticlesRepository {
  // Repo class that talks to the data source and make decisions to read from netwokr apis or local db(if exists)
//  ApiService _apiService = ApiService();


  var apiService = dependencies<ApiService>();

  Future<dynamic> fetchArticlesResponse() async {
    try {
      final Map<String, dynamic> response =
          await apiService.getRequest(ApiConstants.mostViewedArticlesUrl);

      return ApiEntry.fromJson(response);
    } on Exception {
      throw FetchDataException('Error occured');
    }
  }
}
