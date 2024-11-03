// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) => GroupModel(
      identifier:
          IdentifierModel.fromJson(json['identifier'] as Map<String, dynamic>),
      name: json['name'] as String,
      shortDescription: json['shortDescription'] as String,
      description: json['description'] as String,
      imageLarge: json['imageLarge'] as String,
      imageSmall: json['imageSmall'] as String,
      authors: (json['authors'] as List<dynamic>)
          .map((e) => AuthorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: (json['features'] as List<dynamic>)
          .map((e) => FeatureModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
