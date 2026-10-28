import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c20_dokki/core/utils/provide_dio.dart';
import 'package:news_c20_dokki/data/models/articles_response.dart';
import 'package:news_c20_dokki/data/models/sources_response.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_client.g.dart';


@singleton
@RestApi()
abstract class NewsApiClient {
  @factoryMethod
  factory NewsApiClient(Dio dio) = _NewsApiClient;

  @GET("/v2/top-headlines/sources")
  Future<SourcesResponse> getSources(@Query("category") String category);

  @GET("/v2/top-headlines")
  Future<ArticlesResponse> getArticles(@Query("sources") String source);
}
