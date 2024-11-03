import 'package:json_annotation/json_annotation.dart';

import '../entities/author_entity.dart';
import '../entities/feature_entity.dart';
import '../entities/group_entity.dart';
import 'author_model.dart';
import 'feature_model.dart';
import 'identifier_model.dart';

part 'group_model.g.dart';

@JsonSerializable(createToJson: false)
class GroupModel extends GroupEntity {
  GroupModel({
    required IdentifierModel identifier,
    required super.name,
    required super.shortDescription,
    required super.description,
    required super.imageLarge,
    required super.imageSmall,
    required List<AuthorModel> authors,
    required List<FeatureModel> features,
  }) : super(
          identifier: identifier,
          authors: authors,
          features: features,
        );

  @override
  IdentifierModel get identifier => super.identifier as IdentifierModel;

  @override
  List<AuthorEntity> get authors => super.authors as List<AuthorModel>;

  @override
  List<FeatureEntity> get features => super.features as List<FeatureModel>;

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}
