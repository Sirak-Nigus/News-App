class News {
  final String newsId;
  final String newsTitle;
  final String newsPicture;
  final String newsContent;
  DateTime createdAt;
  final String newsAuthor;
  List<dynamic> newsImages;
  final String newsSource;
  Map<String, dynamic> category;
  List<dynamic> comment;

  News({
    this.newsId,
    this.newsTitle,
    this.newsPicture,
    this.newsContent,
    this.createdAt,
    this.newsAuthor,
    this.newsImages,
    this.newsSource,
    this.category,
    this.comment,
  });
}
