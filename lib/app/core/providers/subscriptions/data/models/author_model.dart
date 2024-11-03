import 'package:json_annotation/json_annotation.dart';

import '../entities/author_entity.dart';

part 'author_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthorModel extends AuthorEntity {
  AuthorModel({
    required super.name,
    required super.description,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);
}
