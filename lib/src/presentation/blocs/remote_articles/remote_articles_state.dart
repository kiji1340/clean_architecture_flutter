part of 'remote_articles_bloc.dart';

abstract class RemoteArticlesState extends Equatable {
  const RemoteArticlesState();

  @override
  List<Object> get props => [];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesSuccess extends RemoteArticlesState {
  final List<Article> articles;
  final bool noMoreData;

  const RemoteArticlesSuccess({
    required this.articles,
    required this.noMoreData,
  });

  @override
  List<Object> get props => [articles, noMoreData];
}

class RemoteArticlesError extends RemoteArticlesState {
  final DioError error;

  const RemoteArticlesError({required this.error});

  @override
  List<Object> get props => [error];
}
