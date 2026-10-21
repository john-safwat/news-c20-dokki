import 'package:news_c20_dokki/data/data_source/contract/news_local_datasource.dart';
import 'package:news_c20_dokki/data/models/articles_response.dart';
import 'package:news_c20_dokki/data/models/sources_response.dart';

class NewsLocalDatasourceImpl implements NewsLocalDatasource{
  @override
  Future<List<Article>> getArticlesFromLocal(String sourceId) async{
    // TODO: implement getArticlesFromLocal
    return [];
  }

  @override
  Future<List<Source>> getSourcesFromLocal(String category) async{
    // TODO: implement getSourcesFromLocal
    return [];
  }

  @override
  Future<void> saveArticles(List<Article> sources) async{
    // TODO: implement saveArticles
  }

  @override
  Future<void> saveSources(List<Source> sources) async{
    // TODO: implement saveSources
  }

}