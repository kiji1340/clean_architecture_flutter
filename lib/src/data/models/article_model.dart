import 'package:clean_architecture_flutter/src/data/models/source_model.dart';
import 'package:clean_architecture_flutter/src/domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    int? id,
    SourceModel? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          id: id,
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          source == other.source &&
          author == other.author &&
          title == other.title &&
          description == other.description &&
          url == other.url &&
          urlToImage == other.urlToImage &&
          publishedAt == other.publishedAt &&
          content == other.content);

  @override
  int get hashCode =>
      id.hashCode ^
      source.hashCode ^
      author.hashCode ^
      title.hashCode ^
      description.hashCode ^
      url.hashCode ^
      urlToImage.hashCode ^
      publishedAt.hashCode ^
      content.hashCode;

  @override
  String toString() {
    return 'ArticleModel{'
        ' id: $id,'
        ' source: $source,'
        ' author: $author,'
        ' title: $title,'
        ' description: $description,'
        ' url: $url,'
        ' urlToImage: $urlToImage,'
        ' publishedAt: $publishedAt,'
        ' content: $content,'
        '}';
  }

  ArticleModel copyWith({
    int? id,
    SourceModel? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    return ArticleModel(
      id: id,
      source: source,
      author: author ,
      title: title ,
      description: description ,
      url: url ,
      urlToImage: urlToImage ,
      publishedAt: publishedAt,
      content: content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'source': source,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] as int?,
      source: SourceModel.fromJson(map['source'] as Map<String, dynamic>),
      author: map['author'] as String?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      url: map['url'] as String?,
      urlToImage: map['urlToImage'] as String?,
      publishedAt: map['publishedAt'] as String?,
      content: map['content'] as String?,
    );
  }
}
