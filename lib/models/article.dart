class NewsArticle {
  final String imageUrl;
  final String title;
  final String description;
  final String author;

  NewsArticle({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.author,
  });

  NewsArticle.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'] ?? "";
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    author = json['author'] ?? "";
  }
}

