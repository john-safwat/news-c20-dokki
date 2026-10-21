
import 'package:news_c20_dokki/data/models/articles_response.dart';
import 'package:news_c20_dokki/data/models/sources_response.dart';

abstract interface class NewsLocalDatasource {

  Future<void> saveSources(List<Source> sources);
  Future<void> saveArticles(List<Article> sources);
  Future<List<Source>> getSourcesFromLocal(String category);
  Future<List<Article>> getArticlesFromLocal(String sourceId);
}