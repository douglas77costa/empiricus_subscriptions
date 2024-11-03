import 'author_entity.dart';
import 'feature_entity.dart';
import 'identifier_entity.dart';

class GroupEntity {
  final IdentifierEntity identifier;
  final String name;
  final String shortDescription;
  final String description;
  final String imageLarge;
  final String imageSmall;
  final List<AuthorEntity> authors;
  final List<FeatureEntity> features;

  GroupEntity({
    required this.identifier,
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.imageLarge,
    required this.imageSmall,
    required this.authors,
    required this.features,
  });
}
