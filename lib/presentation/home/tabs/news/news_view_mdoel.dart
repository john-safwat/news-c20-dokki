import 'package:injectable/injectable.dart';
import 'package:news_c20_dokki/core/base/base_view_model.dart';
import 'package:news_c20_dokki/data/repo/news_repo.dart';
import 'package:news_c20_dokki/domain/entity/article_entity.dart';
import 'package:news_c20_dokki/domain/entity/news_category.dart';
import 'package:news_c20_dokki/domain/entity/source_entity.dart';
import 'package:news_c20_dokki/domain/use_case/get_articles_use_case.dart';
import 'package:news_c20_dokki/domain/use_case/get_sources_use_case.dart';

@injectable
class NewsViewModel extends BaseViewModel {
  late final NewsCategory category;

  NewsViewModel(this.getArticlesUseCase , this.getSourcesUseCase);

  GetSourcesUseCase getSourcesUseCase;
  GetArticlesUseCase getArticlesUseCase;

  List<SourceEntity> sources = [];
  String? sourcesError;
  bool sourcesLoading = false;

  List<ArticleEntity> articles = [];
  String? articlesError;
  bool articlesLoading = false;

  int selectedIndex = 0;

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    getArticles();
    notifyListeners();
  }

  Future<void> getSources() async {
    sourcesLoading = true;
    notifyListeners();
    try {
      sources = (await getSourcesUseCase.execute(category.categoryId));
      getArticles();
    } catch (e) {
      sourcesError = e.toString();
    }
    sourcesLoading = false;
    notifyListeners();
  }

  Future<void> getArticles() async {
    articlesLoading = true;
    notifyListeners();
    try {
      articles = (await getArticlesUseCase.execute(sources[selectedIndex].id));
    } catch (e) {
      articlesError = e.toString();
    }
    articlesLoading = false;
    notifyListeners();
  }
}
