class Article{
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedTimestamp;
  String content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedTimestamp,
    this.content,
  });

  factory Article.fromJson(Map<dynamic, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedTimestamp: json['publishedAt'],
      content: json['content'],
    );
  }
}

class Source{
  String id;
  String name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<dynamic, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}