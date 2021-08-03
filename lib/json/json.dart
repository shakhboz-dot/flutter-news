class News {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  News.fromJson(Map<String, dynamic> map)
      : author = map['author'],
        title = map['title'],
        description = map['description'],
        url = map['url'],
        urlToImage = map['urlToImage'],
        publishedAt = DateTime.parse(map['publishedAt']),
        content = map['content'];
}
