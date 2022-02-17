import 'package:clean_architecture_flutter/src/domain/entities/source.dart';

class SourceModel extends Source {
  const SourceModel({
     String? id,
     String? name,
  }): super(
    id: id,
    name: name
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourceModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'SourceModel{'  ' id: $id,'  ' name: $name,'  '}';
  }

  SourceModel copyWith({
    String? id,
    String? name,
  }) {
    return SourceModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory SourceModel.fromJson(Map<String, dynamic> map) {
    return SourceModel(
      id: map['id'] as String?,
      name: map['name'] as String?,
    );
  }

}
