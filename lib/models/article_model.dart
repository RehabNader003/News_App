class ArticleModel {
  final String? imagePath;
  final String title;
  final String? description;
  final String? content;
  final String? url;
  final String? publishedAt;
  final String? sourceName;

  ArticleModel( {
    required this.imagePath,
    required this.title,
    this.description,
    this.content,
    this.url,
    this.publishedAt,
    this.sourceName,
  });
}
