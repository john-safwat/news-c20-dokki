import 'package:dio/dio.dart';
import 'package:news_c20_dokki/models/articles_response.dart';
import 'package:news_c20_dokki/models/sources_response.dart';

class ApiManger {
  final dio = Dio();
  ApiManger(){
    dio.options = BaseOptions(
      baseUrl: "https://newsapi.org",
      receiveTimeout: Duration(seconds: 180),
      connectTimeout: Duration(seconds: 180),
      headers: {
        "Authorization": "2c58c6392813448996cbedf8b2cd9b2e",
      },
    );
  }
  Future<SourcesResponse> getSources(String category) async {
    Response response = await dio.get("/v2/top-headlines/sources" , queryParameters: {
      "category": category,
    });
    return SourcesResponse.fromJson(response.data);
  }

  Future<ArticlesResponse> getArticles(String source) async {
    Response response = await dio.get("/v2/top-headlines" , queryParameters: {
      "sources": source,
    });
    return ArticlesResponse.fromJson(response.data);
  }
}
