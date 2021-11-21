import 'dart:convert';

class ArticleModel {
  static List<Article>? articles;
}

class Article {
  final String title;
  final dynamic description;
  final String pubDate;
  final String link;

  Article({
    required this.title,
    required this.description,
    required this.pubDate,
    required this.link,
  });

  Article copyWith({
    int? id,
    String? title,
    dynamic? description,
    String? pubDate,
    String? link,
  }) {
    return Article(
      title: title ?? this.title,
      description: description ?? this.description,
      pubDate: pubDate ?? this.pubDate,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'pubDate': pubDate,
      'link': link,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'],
      description: map['description'],
      pubDate: map['pubDate'],
      link: map['link'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Article( title: $title, description: $description, pubDate: $pubDate, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Article &&
        other.title == title &&
        other.description == description &&
        other.pubDate == pubDate &&
        other.link == link;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        pubDate.hashCode ^
        link.hashCode;
  }
}
