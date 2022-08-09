import 'package:flutter/cupertino.dart';
import 'package:mekelletimes/model/news.dart';
import '../model/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsProvider with ChangeNotifier {
  // final String url = 'http://192.168.1.2:3000/api/v1/news/';
  final String url = 'http://192.168.1.2:3000/api/v1/news/';
  List<News> _news = [];

  List<News> get news {
    return [..._news];
  }

  List<News> _singleNews = [];

  List<News> get singleNews {
    return [..._singleNews];
  }

  // final String authToken;
  // NewsProvider(this.authToken, this._news);

  Future<void> fetchNews() async {
    var response = await http.get(
      url,
      // headers: {HttpHeaders.authorizationHeader: "Bearer $authToken"}
    );

    var extractedData = json.decode(response.body) as Map<String, dynamic>;

    List<News> loadedData = [];
    var data = extractedData['doc'];

    for (var item in data) {
      loadedData.add(News(
          newsId: item['_id'],
          newsTitle: item['newsTitle'],
          newsPicture: item['newsMainPicture'],
          newsContent: item['newsContent'],
          newsAuthor: item['newsAuthor']['name'],
          createdAt: DateTime.parse(item['createdAt']),
          newsSource: item['newsSource']));
      // comment: item['comment']

    }
    _news = loadedData;
    notifyListeners();
  }

  Future<void> fetchSingleNews(String id) async {
    String theUrl = 'http://192.168.1.2:3000/api/v1/news/$id';
    var response = await http.get(
      theUrl,
      headers: {},
    );
    var extractedData = json.decode(response.body) as Map<String, dynamic>;

    List<News> loadedNews = [];

    var data = extractedData['doc'];

    // print();

    loadedNews.add(News(
        newsId: data['_id'],
        newsTitle: data['newsTitle'],
        newsPicture: data['newsMainPicture'],
        newsContent: data['newsContent'],
        newsAuthor: data['newsAuthor']['name'],
        createdAt: DateTime.parse(data['createdAt']),
        newsSource: data['newsSource'],
        category: data['newsCategory']));

    _singleNews = loadedNews;

    notifyListeners();
  }

  findById(String id) {
    return news.firstWhere((news) => news.newsId == id);
  }
}
