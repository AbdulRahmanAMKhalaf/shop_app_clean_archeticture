import 'package:dio/dio.dart';

import '../Utils/EndPoints/EndPoints.dart';
  var dio=Dio();
class DioHelper {
  static var dio = Dio(BaseOptions(
    baseUrl: '${EndPoints.mainEndPoint}',
    receiveDataWhenStatusError: true,
  ));


  /// Dio Get Data
  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? data,
    String lang = 'en',
    String ContentType = 'application/json',
    String? Authorization,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': ContentType,
      'Authorization': Authorization,
    };
    return await dio.get(
      path,
      data: data,
    );
  }


  /// Dio Post Data
 static  Future<Response> postData({
    required String path,
    Map<String, dynamic>? data,
    String lang = 'en',
    String ContentType = 'application/json',
    String? Authorization,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': ContentType,
      'Authorization': Authorization,
    };
    return await dio.post(
      path,
      data: data,
    );
  }


  /// Dio Put Data
  static Future<Response> putData({
    required String path,
    Map<String, dynamic>? data,
    String lang = 'en',
    String ContentType = 'application/json',
    String? Authorization,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': ContentType,
      'Authorization': Authorization,
    };
    return await dio.put(
      path,
      data: data,
    );
  }


  /// Dio Delete Data
  static Future<Response> deleteData({
    required String path,
    Map<String, dynamic>? data,
    String lang = 'en',
    String ContentType = 'application/json',
    String? Authorization,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': ContentType,
      'Authorization': Authorization,
    };
    return await dio.delete(
      path,
      data: data,
    );
  }
}
