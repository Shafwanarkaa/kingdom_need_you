class NewsArticle {
  final String id;
  final String title;
  final String? author;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;

  NewsArticle({
    this.id = '',
    required this.title,
    this.author,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id']?.toString() ?? '',
      title: json['user_name'] ?? (json['title'] ?? ''),
      author: json['meta'] ?? (json['author'] ?? ''),
      url: json['url'] ?? '',
      urlToImage: json['imageUrl'] ?? (json['urlToImage'] ?? ''),
      publishedAt: _parseDate(json['createdAt'] ?? json['publishedAt']),
      content: json['content'] as String?,
    );
  }

  static DateTime _parseDate(dynamic date) {
    if (date == null) return DateTime.now();
    if (date is int) {
      return DateTime.fromMillisecondsSinceEpoch(date * 1000);
    }
    if (date is String) {
      return DateTime.tryParse(date) ?? DateTime.now();
    }
    return DateTime.now();
  }
}
