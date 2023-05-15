import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/',
          receiveDataWhenStatusError: true
      ),
    );
  }
  static Future<Response?> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response?> postData({
    required String url,
    required Map<String, dynamic> query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async{
    dio.options.headers = {
      'lang' : lang,
      'Authorization' : token,
    };
    return await dio.post(url, queryParameters: query, data: data);
  }
}