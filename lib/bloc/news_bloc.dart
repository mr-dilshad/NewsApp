import 'dart:async';

import '../models/news_model.dart';
import '../repository/news_repository.dart';

class NewsBloc {
  final _repository = NewsRepository();
  final _newFetcher = StreamController<NewsModel>();

  Stream<NewsModel> get allNews => _newFetcher.stream;

  fetchAllNews() async {
    NewsModel newsModel = await _repository.fetchAllNews();
    _newFetcher.sink.add(newsModel);
  }

  dispose() {
    _newFetcher.close();
  }
}

final bloc = NewsBloc();
