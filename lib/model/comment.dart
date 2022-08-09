import 'package:flutter/foundation.dart';

class Comment {
  final String commentId;
  final String newsId;
  final String comment;
  final DateTime createdAt;
  final Map<String, dynamic> user;
  final String userId;

  const Comment(
      {this.commentId,
      this.newsId,
      this.comment,
      this.createdAt,
      this.userId,
      this.user});
}
