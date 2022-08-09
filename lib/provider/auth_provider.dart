import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mekelletimes/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  Response response;

  var dio = Dio();

  // String registerUrl = 'http://192.168.1.2:3000/api/v1/users/signup';
  // String loginUrl = 'http://192.168.1.2:3000/api/v1/users/login';

  String registerUrl = 'http://192.168.1.2:3000/api/v1/users/signup';

  String loginUrl = 'http://192.168.1.2:3000/api/v1/users/login';

  String _token;
  String _userId;
  String _name;
  String _email;

  List<User> _user = [];

  List<User> get user {
    return [..._user];
  }

  bool get isAuth {
    return token != null;
  }

  String get name {
    return _name;
  }

  String get email {
    return _email;
  }

  String get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    if (_userId != null) {
      return _userId;
    }
    return null;
  }

  Future<void> signUp(String name, String email, String password,
      String passwordConfirm) async {
    try {
      response = await dio.post(registerUrl, data: {
        'name': name,
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm
      });

      print(response.data);
      _token = response.data['token'];
      var user = response.data['user'] as Map<String, dynamic>;
      var userToken = response.data['token'];

      List<User> loggedInUser = [];

      loggedInUser.add(User(
          userId: user['_id'],
          name: user['name'],
          email: user['email'],
          photo: user['photo'],
          token: userToken));

      _user = loggedInUser;
      storeUser(_token, user);
      print(_user.single);
    } on DioError catch (error) {
      print(error.response.data['message']);
    }
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    try {
      var response = await dio
          .post(loginUrl, data: {'email': email, 'password': password});
      print(response.data);
      _token = response.data['token'];
      _userId = response.data['user']['_id'];
      var user = response.data['user'] as Map<String, dynamic>;

      List<User> loggedInUser = [];

      loggedInUser.add(User(
          userId: user['_id'],
          name: user['name'],
          email: user['email'],
          photo: user['photo'],
          token: _token));

      _user = loggedInUser;

      // final prefs = await SharedPreferences.getInstance();
      // final userData = json.encode({
      //   'token': _token,
      //   'userId': user['_id'],
      //   'name': user['name'],
      //   'email': user['email'],
      //   'photo': user['photo'],
      // });
      // prefs.setString('userData', userData);
      storeUser(_token, user);
      // prefs.setStringList('user',userInfo);
      notifyListeners();
    } on DioError catch (error) {
      throw error.response.data;
    }
  }

  Future<void> storeUser(String _token, Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'token': _token,
      'userId': user['_id'],
      'name': user['name'],
      'email': user['email'],
      'photo': user['photo'],
    });
    prefs.setString('userData', userData);
  }

  Future<void> updateStoreduser() async {}

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }

    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    //  _user = extractedUserData['user'];
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _name = extractedUserData['name'];
    _email = extractedUserData['email'];
    print('sharedPrefer : ${extractedUserData['name']}');
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _user = null;
    // print(_user.length);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
