
class NewsArticle {
  final String title;
  final String? author;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;

  NewsArticle({
    required this.title,
    this.author,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  // Factory constructor to create a NewsArticle from a JSON object
  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] as String,
      author: json['author'] as String?,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String?,
    );
  }
}
