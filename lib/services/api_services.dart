import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kalpasnewsapp/constants/strings.dart';
import 'package:kalpasnewsapp/model/newsmodel/news_model.dart';

class ApiClient {
  static Future<NewsModel?> fetchNews() async {
    try {
      var response = await http.get(Uri.parse(
          "$baseUrl/top-headlines?country=us&category=business&apiKey=$apiKey"));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        NewsModel data = NewsModel.fromJson(jsonData);
        return data;
      } else {
        print("API request failed with status code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception occurred: $e");
      // You can throw a custom exception or return null here if needed
      return null;
    }
  }
}
