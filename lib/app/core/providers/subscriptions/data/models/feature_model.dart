import 'package:json_annotation/json_annotation.dart';

import '../entities/feature_entity.dart';

part 'feature_model.g.dart';

@JsonSerializable(createToJson: false)
class FeatureModel extends FeatureEntity {
  FeatureModel({
    required super.title,
    required super.description,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);
}
