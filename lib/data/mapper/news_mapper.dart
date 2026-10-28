import 'package:injectable/injectable.dart';
import 'package:news_c20_dokki/data/models/articles_response.dart' hide Source;
import 'package:news_c20_dokki/data/models/sources_response.dart';
import 'package:news_c20_dokki/domain/entity/article_entity.dart';
import 'package:news_c20_dokki/domain/entity/source_entity.dart';

@injectable
class NewsMapper {
  List<SourceEntity> mapSources(SourcesResponse response) {
    List<SourceEntity> sources = [];
    for (var source in response.sources ?? []) {
      sources.add(mapSourceDtoToEntity(source));
    }
    return sources;
  }

  List<SourceEntity> mapSourcesList(List<Source> sourcesList){
    List<SourceEntity> sources = [];
    for (var source in sourcesList) {
      sources.add(mapSourceDtoToEntity(source));
    }
    return sources;
  }

  SourceEntity mapSourceDtoToEntity(Source source) {
    return SourceEntity(source.id ?? "", source.name ?? "");
  }

  List<ArticleEntity> mapArticleResponseToEntity(ArticlesResponse response) {
    List<ArticleEntity> articles = [];
    for (var article in response.articles ?? []) {
      articles.add(mapArticleDtoToEntity(article));
    }
    return articles;
  }

  List<ArticleEntity> mapArticleListToEntity(List<Article> response) {
    List<ArticleEntity> articles = [];
    for (var article in response) {
      articles.add(mapArticleDtoToEntity(article));
    }
    return articles;
  }


  ArticleEntity mapArticleDtoToEntity(Article article) {
    return ArticleEntity(
      article.urlToImage ?? "",
      article.title ?? "",
      article.author ?? "",
      article.publishedAt ?? "",
      article.url ?? "",
    );
  }
}
