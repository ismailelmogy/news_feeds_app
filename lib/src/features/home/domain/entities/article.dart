import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  final String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  @override
  List<Object?> get props =>
      [author, title, description, url, urlToImage, publishedAt];
}
