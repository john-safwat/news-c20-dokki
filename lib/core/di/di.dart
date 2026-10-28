import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c20_dokki/core/di/di.config.dart';


GetIt get = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => get.init();

// void configureDependencies() {
//   get.registerSingleton<Dio>(provideDio());
//   get.registerSingleton<Connectivity>(getConnectivity());
//   get.registerFactory<NewsLocalDatasource>(() => NewsLocalDatasourceImpl());
//   get.registerFactory<NewsMapper>(() => NewsMapper());
//   get.registerSingleton<NewsApiClient>(NewsApiClient(get()));
//   get.registerFactory<NewsRepo>(() => NewsRepoImpl(get(), get(), get(), get()));
//   get.registerFactory<GetSourcesUseCase>(()=>GetSourcesUseCase(get()));
//   get.registerFactory<GetArticlesUseCase>(()=>GetArticlesUseCase(get()));
//   get.registerFactory<NewsViewModel>(()=>NewsViewModel(get(), get()));
// }
