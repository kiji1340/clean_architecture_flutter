import 'dart:developer';
import 'dart:io';

import 'package:clean_architecture_flutter/src/core/params/article_request.dart';
import 'package:clean_architecture_flutter/src/core/resources/data_state.dart';
import 'package:clean_architecture_flutter/src/data/datasources/remote/news_api.dart';
import 'package:clean_architecture_flutter/src/domain/entities/article.dart';
import 'package:clean_architecture_flutter/src/domain/repositories/articles_repository.dart';
import 'package:dio/dio.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  final NewsApi _newsApi;

  const ArticlesRepositoryImpl(this._newsApi);

  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(
      ArticlesRequestParams params) async {
    try {
      final httpResponse = await _newsApi.getBreakingNewsArticles(
        apiKey: params.apiKey,
        country: params.country,
        category: params.category,
        page: params.page,
        pageSize: params.pageSize,
      );
      log("call: call api");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if (httpResponse.data.articles != null) {
          return DataSuccess(httpResponse.data.articles!);
        }
      }

      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      log("call: $e");
      return DataFailed(e);
    }
  }
}
