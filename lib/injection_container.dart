import 'package:blog/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:blog/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:blog/features/daily_news/domain/repository/article_repository.dart';
import 'package:blog/features/daily_news/domain/usecases/get_article.dart';
import 'package:blog/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // external
  sl.registerSingleton<Dio>(Dio());

  // data sources
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // repositories
  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl()),
  );

  // use cases
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl()),
  );

  // blocs
  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(sl()),
  );
}
