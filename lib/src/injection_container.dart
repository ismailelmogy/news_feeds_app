import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feeds_app/src/features/home/data/repositories/articles_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'features/home/data/datasources/articles_remote_data_source.dart';
import 'features/home/domain/repositories/articles_repository.dart';
import 'features/home/domain/usecases/get_articles.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  // Blocs
  serviceLocator.registerFactory<HomeBloc>(() => HomeBloc(
        getArticles: serviceLocator(),
      ));

  // Use cases
  serviceLocator.registerLazySingleton<GetArticles>(
      () => GetArticles(articlesRepository: serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<ArticlesRepository>(
      () => ArticlesRepositoryImpl(articlesRemoteDataSource: serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<ArticlesRemoteDataSource>(
      () => ArticlesRemoteDataSourceImpl(apiConsumer: serviceLocator()));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton(() => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));
  serviceLocator.registerLazySingleton(() => AppIntercepters());
}
