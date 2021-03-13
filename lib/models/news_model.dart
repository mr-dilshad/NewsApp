class NewsModel {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsModel({this.status, this.totalResults, this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> parsedJson) {
    return NewsModel(
      status: parsedJson['status'],
      totalResults: parsedJson['totalResults'],
      articles: List<Article>.from(parsedJson['articles']
          .map((article) => Article.fromJson(article))
          .toList()),
    );
  }
}

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Article.fromJson(Map<String, dynamic> article) {
    return Article(
      source: Source.fromJson(article['source']),
      author: article['author'],
      title: article['title'],
      description: article['description'],
      url: article['url'],
      urlToImage: article['urlToImage'],
      publishedAt: time(article['publishedAt']),
      content: article['content'],
    );
  }
}

class Source {
  String id;
  String name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> source) {
    return Source(
      id: source['id'] ?? "",
      name: source['name'] ?? "",
    );
  }
}

// time since published
String time(String published_time) {
  Duration dif = DateTime.now().difference(DateTime.parse(published_time));
  String time =  "${dif.inHours}:${dif.inMinutes.remainder(60)}:${(dif.inSeconds.remainder(60))}";;
  return time;
}
