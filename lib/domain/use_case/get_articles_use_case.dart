import 'package:news_c20_dokki/domain/entity/article_entity.dart';
import 'package:news_c20_dokki/domain/repo/news_repo.dart';

class GetArticlesUseCase{
  NewsRepo repo;

  GetArticlesUseCase(this.repo);

  Future<List<ArticleEntity>> execute(String sourceId) async{
    // can have filtration logic
    return repo.getArticles(sourceId);
  }
}