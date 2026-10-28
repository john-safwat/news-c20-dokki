import 'package:injectable/injectable.dart';
import 'package:news_c20_dokki/data/repo/news_repo.dart';
import 'package:news_c20_dokki/domain/entity/source_entity.dart';
import 'package:news_c20_dokki/domain/repo/news_repo.dart';

@injectable
class GetSourcesUseCase{
  NewsRepo newsRepo;

  GetSourcesUseCase(this.newsRepo);

  Future<List<SourceEntity>> execute(String category) async{
    // can have filtration logic
    return newsRepo.getSources(category);
  }
}