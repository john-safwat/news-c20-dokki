import 'package:dio/dio.dart';
import 'package:news_c20_dokki/data/models/articles_response.dart';
import 'package:news_c20_dokki/data/models/sources_response.dart';

import '../contract/news_remote_datasource.dart' show NewsRemoteDatasource;

class NewsRemoteDatasourceImpl implements NewsRemoteDatasource {
  final dio = Dio();

  NewsRemoteDatasourceImpl() {
    dio.options = BaseOptions(
      baseUrl: "https://newsapi.org",
      receiveTimeout: Duration(seconds: 180),
      connectTimeout: Duration(seconds: 180),
      headers: {"Authorization": "2c58c6392813448996cbedf8b2cd9b2e"},
    );
  }

  @override
  Future<SourcesResponse> getSources(String category) async {
    Response response = await dio.get(
      "/v2/top-headlines/sources",
      queryParameters: {"category": category},
    );
    return SourcesResponse.fromJson(response.data);
  }

  @override
  Future<ArticlesResponse> getArticles(String source) async {
    Response response = await dio.get(
      "/v2/top-headlines",
      queryParameters: {"sources": source},
    );
    return ArticlesResponse.fromJson(response.data);
  }
}
