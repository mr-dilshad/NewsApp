import 'dart:convert';

import 'package:bicsom/models/news_model.dart';
import 'package:http/http.dart' show Client;

class NewsApiProvider {
  Client client = Client();
  final _url =
      'https://newsapi.org/v2/top-headlines?category=sports&country=us&apiKey=7ed61ce5b4fd48fe9f89598984864979';

  Future<NewsModel> fetchNews() async {
    final response = await client.get(Uri.parse(_url));
    print(response.body);
    if (response.statusCode == 200) {
      return NewsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
