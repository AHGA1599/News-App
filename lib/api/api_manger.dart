import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/NewsResponse.dart';
import 'api_conctans.dart';
import '../model/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String categoryId) async {
    /*
    https://newsapi.org/v2/top-headlines/sources?apiKey=ad389b8d47ee4f4c9a0479616cb6c781
     */
    // عملت مكان وحفظت فيه اسم السيرفر والsource
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sources,
        {'apiKey': 'ad389b8d47ee4f4c9a0479616cb6c781',
        'category':categoryId
        });
    try {
      var response = await http.get(url);
      var bodyString = response.body; // String
      var json = jsonDecode(bodyString); // to json
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId, {String? query}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.NewsApi,
        {'apiKey': 'ad389b8d47ee4f4c9a0479616cb6c781',
          'sources': sourceId});
    try {
      var respons = await http.get(url);
      var bodyNewsString = respons.body;
      var json = jsonDecode(bodyNewsString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
