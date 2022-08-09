import 'package:flutter/cupertino.dart';
import '../model/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LatestNewsProvider with ChangeNotifier {
  final String url = 'http://192.168.1.2:3000/api/v1/news/latest-news';

  List<News> _latestNews = [];

  List<News> get latestNews {
    return [..._latestNews];
  }

  Future<void> fetchLatestNews() async {
    var response = await http.get(
      url,
      // headers: {HttpHeaders.authorizationHeader: "Bearer $authToken"}
    );

    var extractedData = json.decode(response.body) as Map<String, dynamic>;
    List<News> loadedNews = [];
    var data = extractedData['doc'] as List;

    for (var item in data) {
      loadedNews.add(News(
          newsId: item['_id'],
          newsTitle: item['newsTitle'],
          newsPicture: item['newsMainPicture'],
          newsContent: item['newsContent'],
          newsAuthor: item['newsAuthor']['name'],
          createdAt: DateTime.parse(item['createdAt']),
          newsSource: item['newsSource']));

      _latestNews = loadedNews;
    }

    // for (var item in data) {
    //   loadedNews.add(News(
    //     newsId: item['_id'],
    //     newsTitle: item['newsTitle'],
    //     newsPicture: item['newsPicture'],
    //     newsContent: item['newsContent'],
    //     createdAt: DateTime.parse(item['createdAt']),
    //     newsAuthor: item['newsAuthor'],
    //     newsImages: item['newsImages'],
    //     newsSource: item['newsSource'],
    //     category: (item['newsCategory']) as Map<String, dynamic>,
    //     //  comments: item['comments']
    //   ));

    // }
    _latestNews = loadedNews;
    notifyListeners();
  }
}
