import 'package:clean_architecture_flutter/src/core/params/article_request.dart';
import 'package:clean_architecture_flutter/src/core/resources/data_state.dart';
import 'package:clean_architecture_flutter/src/domain/entities/article.dart';

abstract class ArticlesRepository {
  Future<DataState<List<Article>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  );
}
