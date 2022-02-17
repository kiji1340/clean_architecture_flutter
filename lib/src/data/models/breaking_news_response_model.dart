import 'package:clean_architecture_flutter/src/data/models/article_model.dart';
import 'package:clean_architecture_flutter/src/domain/entities/article.dart';

class BreakingNewsResponseModel {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  const BreakingNewsResponseModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BreakingNewsResponseModel &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          totalResults == other.totalResults &&
          articles == other.articles);

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ articles.hashCode;

  @override
  String toString() {
    return 'BreakingNewsResponseModel{' +
        ' status: $status,' +
        ' totalResults: $totalResults,' +
        ' articles: $articles,' +
        '}';
  }

  BreakingNewsResponseModel copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) {
    return BreakingNewsResponseModel(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': this.status,
      'totalResults': this.totalResults,
      'articles': this.articles,
    };
  }

  factory BreakingNewsResponseModel.fromJson(Map<String, dynamic> map) {
    return BreakingNewsResponseModel(
      status: map['status'] as String,
      totalResults: map['totalResults'] as int,
      articles: List<ArticleModel>.from(
        (map['articles'] as List<dynamic>).map(
          (e) => ArticleModel.fromJson(e as Map<String, dynamic>),
        ),
      ),
    );
  }
}
