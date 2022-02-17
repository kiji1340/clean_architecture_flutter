import 'package:clean_architecture_flutter/src/core/bloc/bloc_with_state.dart';
import 'package:clean_architecture_flutter/src/core/params/article_request.dart';
import 'package:clean_architecture_flutter/src/core/resources/data_state.dart';
import 'package:clean_architecture_flutter/src/domain/entities/article.dart';
import 'package:clean_architecture_flutter/src/domain/usecases/get_articles_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'remote_articles_event.dart';

part 'remote_articles_state.dart';

class RemoteArticlesBloc
    extends BlocWithState<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticlesUseCase _getArticlesUseCase;

  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 20;

  RemoteArticlesBloc(this._getArticlesUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>((event, emit) async {
      emit(const RemoteArticlesLoading());
      final response =
          await _getArticlesUseCase(params: ArticlesRequestParams(page: _page));

      if (response is DataSuccess && response.data!.isNotEmpty) {
        final articles = response.data;
        final noMoreData = articles!.length < _pageSize;

        _articles.addAll(articles);
        _page++;

        emit(
            RemoteArticlesSuccess(articles: _articles, noMoreData: noMoreData));
      }

      if (response is DataFailed) {
        emit(RemoteArticlesError(error: response.error!));
      }
    });
  }
}
