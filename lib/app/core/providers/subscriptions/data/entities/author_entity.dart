class AuthorEntity{
  final String name;
  final String? photoSmallUrl;
  final String? photoLargeUrl;
  final String description;

  AuthorEntity({
    required this.name,
    this.photoSmallUrl,
    this.photoLargeUrl,
    required this.description,
  });
}