import 'package:bicsom/models/news_model.dart';
import 'package:bicsom/network_provider/news_api_provider.dart';

class NewsRepository {
  final newsApiProvider = NewsApiProvider();

  Future<NewsModel> fetchAllNews() {
    return newsApiProvider.fetchNews();
    }
}
