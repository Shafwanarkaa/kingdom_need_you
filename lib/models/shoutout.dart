class Shoutout {
  final String id;
  final String userName;
  final String content;
  final String imageUrl;
  final String meta;
  final DateTime createdAt;

  Shoutout({
    required this.id,
    required this.userName,
    required this.content,
    required this.imageUrl,
    required this.meta,
    required this.createdAt,
  });

  factory Shoutout.fromJson(Map<String, dynamic> json) {
    return Shoutout(
      id: json['id'] ?? '',
      userName: json['user_name'] ?? 'Anonymous',
      content: json['content'] ?? (json['context'] ?? ''),
      imageUrl:
          json['imageUrl'] ??
          'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
      meta: json['meta'] ?? '',
      createdAt: _parseDate(json['createdAt']),
    );
  }

  static DateTime _parseDate(dynamic date) {
    if (date == null) return DateTime.now();
    if (date is int) {
      // MockAPI sometimes generates Unix timestamps in seconds
      return DateTime.fromMillisecondsSinceEpoch(date * 1000);
    }
    if (date is String) {
      return DateTime.tryParse(date) ?? DateTime.now();
    }
    return DateTime.now();
  }

  Map<String, dynamic> toJson() {
    return {
      'type': 'shoutout',
      'user_name': userName,
      'content': content,
      'imageUrl': imageUrl,
      'meta': meta,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
