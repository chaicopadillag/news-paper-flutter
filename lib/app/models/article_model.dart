class Article {
  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? null,
        title: json["title"],
        description: json["description"] ?? null,
        url: json["url"],
        urlToImage: json["urlToImage"] ?? null,
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author ?? null,
        "title": title,
        "description": description ?? null,
        "url": url,
        "urlToImage": urlToImage ?? null,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content ?? null,
      };
}

class Source {
  Source({
    this.id,
    required this.name,
  });

  String? id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? null,
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name,
      };
}
