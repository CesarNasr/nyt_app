import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http if (dart.library.io) '';
import 'ApiExceptions.dart';

class ApiService {

  // get method to fetch api data
  Future<dynamic> getRequest(String url) async {

    var responseJson;
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 15));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw UnauthorisedException('Unauthorized');
    } on TimeoutException {
      throw FetchDataException('No Internet connection');
    }

    Map<String, dynamic> resp = responseJson;
    return resp;
  }


  // fetching response status
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
