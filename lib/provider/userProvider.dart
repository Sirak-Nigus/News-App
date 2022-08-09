import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mekelletimes/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider with ChangeNotifier {
  List<User> _user = [];

  UserProvider(this.userId, this.authToken, this._user);

  List<User> get user {
    return [..._user];
  }

  final String userId;
  final String authToken;

  Future<void> fetchUser() async {
    // final url = 'http://192.168.1.2:3000/api/v1/users/profile';
    final url = 'http://192.168.1.2:3000/api/v1/users/profile';

    try {
      var response = await http.get(url,
          headers: {HttpHeaders.authorizationHeader: 'Bearer $authToken'});

      var loggedInUser = json.decode(response.body) as Map<String, dynamic>;

      List<User> loadedUser = [];

      loadedUser.add(User(
          userId: loggedInUser['user']['_id'],
          name: loggedInUser['user']['name'],
          email: loggedInUser['user']['email'],
          token: null));

      _user = loadedUser;
      // loadedUser.clear();
      notifyListeners();
    } on DioError catch (error) {
      print(error.response.data);
    }
  }

  Future<void> updateProfile(User user) async {
    final String url = 'http://192.168.1.2:3000/api/v1/users/updateProfile';
    try {
      var response = await Dio().patch(url,
          data: {'name': user.name},
          options: Options(
              headers: {HttpHeaders.authorizationHeader: "Bearer $authToken"}));
      notifyListeners();
    } on DioError catch (error) {
      print(error.response.data);
    }
  }

  Future<void> deActivateAccount() async {
    final String url = 'http://192.168.1.2:3000/api/v1/users/deleteProfile';

    try {
      var response = await http.delete(url,
          headers: {HttpHeaders.authorizationHeader: "Bearer $authToken"});
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
