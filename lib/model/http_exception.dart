

import 'package:dio/dio.dart';

class HttpException extends DioError implements Exception{
    final String message;

  HttpException(this.message);

  @override
  String toString() {
    
    return message;
  }

}