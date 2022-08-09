import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mekelletimes/model/comment.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';

class CommentProvider with ChangeNotifier {
  // Response response;

  List<Comment> _comments = [];

  List<Comment> get comments {
    return [..._comments];
  }

  String authToken;
  String userId;
  bool isAuth;

  CommentProvider(this.authToken, this._comments, this.userId, this.isAuth);

  Future<void> postComment(Comment comment) async {
    print(userId);
    print(comment.comment);

    final url = 'http://192.168.1.2:3000/api/v1/comments';
    try {
      var response = await Dio().post(
        url,
        data: {
          'comment': comment.comment,
          'user': userId,
          'news': comment.newsId,
        },
        options: Options(
            headers: {HttpHeaders.authorizationHeader: "Bearer $authToken"}),
      );
      notifyListeners();
      print(response.data);
    } on DioError catch (error) {
      print(error.response.data);
    }
  }

  Future<void> updateComment(Comment comment) async {
    final url = 'http://192.168.1.2:3000/api/v1/comments/${comment.commentId}';
    try {
      var response = await Dio().patch(url,
          data: {
            'comment': comment.comment,
            'user': userId,
            'news': comment.newsId
          },
          options: Options(
              headers: {HttpHeaders.authorizationHeader: "Bearer $authToken"}));
      print(response.data);
      notifyListeners();
    } on DioError catch (error) {
      print(error.response.data);
    }
  }

  Future<void> deleteComment(String commentId) async {
    final url = 'http://192.168.1.2:3000/api/v1/comments/$commentId';

    try {
      var response = Dio().delete(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: "Bearer $authToken"}));
      notifyListeners();
    } catch (error) {
      print(error.response.data);
    }
  }

  Future<void> fetchComments(String id) async {
    print(id);
    final url = 'http://192.168.1.2:3000/api/v1/news/$id/comments';
    var response = await http.get(url,
        headers: {HttpHeaders.authorizationHeader: "Bearer $authToken"});
    print(json.encode(response.body));
    var extractedComment = json.decode(response.body) as Map<String, dynamic>;
    List<Comment> loadedData = [];
    // print(loadedData);
    final loadedComment = extractedComment['comment'];

    for (var comm in loadedComment) {
      loadedData.add(Comment(
          commentId: comm['_id'],
          newsId: comm['news'],
          comment: comm['comment'],
          user: comm['user']));
      // print(loadedData.map((e) => e.user.t));

      // N.B don't forget using fetchComments() for comments section
    }
    _comments = loadedData;
    notifyListeners();
  }
}
