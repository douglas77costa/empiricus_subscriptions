import 'package:json_annotation/json_annotation.dart';

import '../entities/identifier_entity.dart';

part 'identifier_model.g.dart';

@JsonSerializable(createToJson: false)
class IdentifierModel extends IdentifierEntity {
  IdentifierModel({required super.slug});

  factory IdentifierModel.fromJson(Map<String, dynamic> json) =>
      _$IdentifierModelFromJson(json);
}
