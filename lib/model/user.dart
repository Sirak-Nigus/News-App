import 'package:flutter/foundation.dart';

class User {
  final String userId;
  final String name;
  final String email;
  final String photo;
  final String password;
  final String passwordConfirm;
  final String token;

  User(
      {this.userId,
      this.name,
      this.email,
      this.photo,
      this.password,
      this.passwordConfirm,
      this.token});
}
