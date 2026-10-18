class Article {
  String title = "";
  String description = "";
  String url = "";
  String urlToImage = "";
  String publishedAt = "";
  String content = "";

  Article(
      {this.title = "", this.description = "", this.url = "", this.urlToImage = "",
        this.publishedAt = "", this.content = ""});

  Article copyWith({
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    return Article(
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }


}

void main() {
  Article article = Article().copyWith(
    title: "John",
    description: "Doe",
    url: "https://www.google.com",
  );
}
