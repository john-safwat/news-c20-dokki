import 'package:injectable/injectable.dart';
import 'package:news_c20_dokki/data/repo/news_repo.dart';
import 'package:news_c20_dokki/domain/entity/article_entity.dart';
import 'package:news_c20_dokki/domain/repo/news_repo.dart';

@injectable
class GetArticlesUseCase{
  NewsRepo repo;

  GetArticlesUseCase(this.repo);

  Future<List<ArticleEntity>> execute(String sourceId) async{
    // can have filtration logic
    return repo.getArticles(sourceId);
  }
}