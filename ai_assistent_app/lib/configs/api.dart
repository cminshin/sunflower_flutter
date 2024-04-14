import 'dart:convert';
import 'dart:io';

import 'package:ai_assistent_app/logs/make_logs.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

var logger = Logger(
  printer: PrettyPrinter(),
);

class AppAPI {
  static String baseUrl1 = 'https://localhost:2020';
  static String baseUrl2 = 'http://localhost:2020';
  static String baseUrl3 = 'localhost:2020';
  static String baseUrl = 'https://movie-recommendation.kro.kr';
  // static String baseUrl = 'https://~~~';

  // static getHeader() {
  //   AccountController accountController = Get.find();
  //   return {
  //     'Authorization': 'token : ${accountController.accessToken.value}',
  //   };
  // }

  // 2024.03.19
  // 유저 구분을 헤더로 하는데,
  // 이 부분은 백엔드쪽에서 강의 들어보고 맞춰서 해야 할듯.

  static checkAccessToken(String accessToken) async {
    Dio dio = DioServices().to();
    final res = await dio.post('/api/v1/check_token', data: {
      'token': accessToken,
    });
    var data = res.data;
    return data['token'];
  }

  static login(id, password) async {
    Dio dio = DioServices().to();
    final res = await dio.post('/api/v1/login', data: {
      'id': id,
      'password': password,
    });
    var data = res.data;
    return {
      'success': data['access_token'] != null,
      'accessToken': data['access_token'] ?? '',
    };
  }

  static logout() async {
    Dio dio = DioServices().to();
    final res = await dio.post('/api/v1/user/logout');
    var data = res.data;
    return {
      'success': data['logout_status'] == 'true',
    };
  }

  static getUserInfo() async {
    Dio dio = DioServices().to();
    final res = await dio.get('/api/v1/user');
    var data = res.data;
    return data;
  }

  static sendGenres() async {
    Dio dio = DioServices().to();
    final res = await dio.post('/favoritegenres', data: {
      'genre1': "sf",
      'genre2': "romance",
    });
    var data = res.data;
    print(data.toString());
    return;
  }

  static sendGenres2() async {
    // String url = "movie-recommendation.kro.kr:8080";
    // final res = await http.get(
    //   Uri.http(url, '/asdf'),
    // );
    // final data = json.decode(utf8.decode(res.bodyBytes));
    // logger.i(data);
    // return data;
    print('$baseUrl/favoritegenres');
    final res = await http.post(
      Uri.parse('$baseUrl/favoritegenres'),
      body: {
        'genre1': "sf",
        'genre2': "romance",
      },
    );
    // final data = res.body;
    final data = json.decode(utf8.decode(res.bodyBytes));
    logger.i(data);
    return data;
  }

  static getJang() async {
    final res = await http.get(Uri.parse('$baseUrl/asdf'));
    final data = res.body;
    // final data = json.decode(utf8.decode(res.bodyBytes));
    logger.i(data);
    return data;
  }

  //
  // {
  //   genre1:"sf",
  //   genre2: "romance",
  // }
  static sendGenres3(List<String> genres) async {
    // print('$baseUrl/favoritegenres');
    for (int i = 1; i < 4; i++) {
      sleep(const Duration(seconds: 2));
      try {
        saveLogToFile('sendgenres $baseUrl$i');
        final res = await http.post(
          Uri.parse('$baseUrl$i/favoritegenres'),
          body: {
            'genre1': genres[0],
            'genre2': genres[1],
            'genre3': genres[2],
          },
        );
        // final data = res.body;
        final data = json.decode(utf8.decode(res.bodyBytes));
        logger.i(data);
        saveLogToFile(data.toString());
        Get.snackbar('send genres return value', data);
        return data;
      } catch (e) {
        Get.snackbar('send genres return err', e.toString());
        saveLogToFile(e.toString());
      }
    }
  }

  static sendMovies(List<String> movies) async {
    // print('$baseUrl/favoritemovies');
    for (int i = 1; i < 4; i++) {
      sleep(const Duration(seconds: 2));
      try {
        saveLogToFile('sendmovies $baseUrl$i');
        final res = await http.post(
          Uri.parse('$baseUrl$i/favoritemovies'),
          body: {
            'movie1': movies[0],
            'movie2': movies[1],
            'movie3': movies[2],
          },
        );
        // final data = res.body;
        final data = json.decode(utf8.decode(res.bodyBytes));
        logger.i(data);
        saveLogToFile(data.toString());
        Get.snackbar('send movies return value', data);
        return data;
      } catch (e) {
        Get.snackbar('send movies return err', e.toString());
        saveLogToFile(e.toString());
      }
    }
  }
}

class DioServices {
  static final DioServices _dioServices = DioServices._internal();
  factory DioServices() => _dioServices;
  Map<String, dynamic> dioInformation = {};

  static Dio _dio = Dio();

  DioServices._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppAPI.baseUrl,
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      sendTimeout: const Duration(milliseconds: 10000),
      // headers: {},
    );
    _dio = Dio(options);
    _dio.interceptors.add(DioInterceptor());
  }

  Dio to() {
    return _dio;
  }
}

class DioInterceptor extends Interceptor {
  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   logger.e("BaseUrl ${options.baseUrl}");
  //   logger.e("Path ${options.path}");
  //   logger.e("Parameters ${options.queryParameters}");
  //   logger.e("Data ${options.data}");
  //   logger.e("Connect Timeout ${options.connectTimeout}");
  //   logger.e("Send Timeout ${options.sendTimeout}");
  //   logger.e("Receive Timeout ${options.receiveTimeout}");
  //   super.onRequest(options, handler);
  // }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   logger.e(response.statusCode);
  //   logger.e(response.data);
  //   logger.e("BaseUrl ${response.requestOptions.baseUrl}");
  //   logger.e("Path ${response.requestOptions.path}");
  //   logger.e("Parameters ${response.requestOptions.queryParameters}");
  //   logger.e("Data ${response.requestOptions.data}");
  //   logger.e("Connect Timeout ${response.requestOptions.connectTimeout}");
  //   logger.e("Send Timeout ${response.requestOptions.sendTimeout}");
  //   logger.e("Receive Timeout ${response.requestOptions.receiveTimeout}");
  //   super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) async {
  //   logger.e("Error ${err.error}");
  //   logger.e("Error Message ${err.message}");
  //   super.onError(err, handler);
  // }
}
