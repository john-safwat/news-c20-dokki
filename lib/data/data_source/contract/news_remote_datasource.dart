import 'package:news_c20_dokki/data/models/articles_response.dart';
import 'package:news_c20_dokki/data/models/sources_response.dart';

abstract interface class NewsRemoteDatasource{
  Future<SourcesResponse> getSources(String category);
  Future<ArticlesResponse> getArticles(String source);
}