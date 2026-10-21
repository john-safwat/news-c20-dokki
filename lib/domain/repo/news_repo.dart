import 'package:news_c20_dokki/domain/entity/article_entity.dart';
import 'package:news_c20_dokki/domain/entity/source_entity.dart';

abstract interface class NewsRepo {
  Future<List<SourceEntity>> getSources(String category);
  Future<List<ArticleEntity>> getArticles(String sourceId);
}