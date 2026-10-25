import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_c20_dokki/data/data_source/contract/news_api_client.dart';
import 'package:news_c20_dokki/data/data_source/contract/news_local_datasource.dart';
import 'package:news_c20_dokki/data/mapper/news_mapper.dart';
import 'package:news_c20_dokki/domain/entity/article_entity.dart';
import 'package:news_c20_dokki/domain/entity/source_entity.dart';
import 'package:news_c20_dokki/domain/repo/news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  Connectivity connectivity;

  NewsLocalDatasource localDatasource;
  NewsApiClient remoteDatasource;
  NewsMapper mapper;

  NewsRepoImpl(
    this.remoteDatasource,
    this.localDatasource,
    this.mapper,
    this.connectivity,
  );

  @override
  Future<List<SourceEntity>> getSources(String category) async {
    var status = await connectivity.checkConnectivity();
    if (status == ConnectivityResult.wifi ||
        status == ConnectivityResult.mobile) {
      var response = await remoteDatasource.getSources(category);
      await localDatasource.saveSources(response.sources ?? []);
      return mapper.mapSources(response);
    } else {
      var response = await localDatasource.getSourcesFromLocal(category);
      return mapper.mapSourcesList(response);
    }
  }

  @override
  Future<List<ArticleEntity>> getArticles(String sourceId) async {
    var status = await connectivity.checkConnectivity();
    if (status == ConnectivityResult.wifi ||
        status == ConnectivityResult.mobile) {
      var response = await remoteDatasource.getArticles(sourceId);
      await localDatasource.saveArticles(response.articles ?? []);
      return mapper.mapArticleResponseToEntity(response);
    } else {
      var response = await localDatasource.getArticlesFromLocal(sourceId);
      return mapper.mapArticleListToEntity(response);
    }
  }
}

