import 'package:clean_architecture_flutter/src/data/datasources/remote/news_api.dart';
import 'package:clean_architecture_flutter/src/data/repositories/articles_repository_impl.dart';
import 'package:clean_architecture_flutter/src/domain/repositories/articles_repository.dart';
import 'package:clean_architecture_flutter/src/domain/usecases/get_articles_usecase.dart';
import 'package:clean_architecture_flutter/src/presentation/blocs/remote_articles/remote_articles_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';


final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<Dio>(Dio());

  injector.registerSingleton<NewsApi>(NewsApi(injector()));
  injector.registerSingleton<ArticlesRepository>(ArticlesRepositoryImpl(injector()));

  injector.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));

  injector.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(injector()));
}