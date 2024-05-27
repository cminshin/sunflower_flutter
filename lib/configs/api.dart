import 'dart:convert';

import 'package:movie_recommendation_front/configs/routes.dart';
import 'package:movie_recommendation_front/controllers/account_controller.dart';
import 'package:movie_recommendation_front/controllers/selection_controller.dart';
import 'package:movie_recommendation_front/logs/make_logs.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

var logger = Logger(
  printer: PrettyPrinter(),
);

class AppAPI {
  static String baseUrl = 'https://movie-recommendation.kro.kr/api';

  static getHeader() {
    AccountController accountController = Get.find();
    var token = accountController.accessToken.value;
    if (token.isEmpty) {
      logout();
    } else {
      return {
        'Authorization': 'Bearer $token',
      };
    }
  }

  static checkAccessToken(String accessToken) async {
    final res = await http.get(Uri.parse('$baseUrl/check_token'), headers: getHeader());
    final data = json.decode(utf8.decode(res.bodyBytes));
    logger.i(data);

    Map<String, String> headertest1 = {'Authorization': 'token'};
    Future.delayed(const Duration(seconds: 2), () async {
      final res = await http.get(Uri.parse('$baseUrl/check_token'), headers: headertest1);
      final data = json.decode(utf8.decode(res.bodyBytes));
      logger.i(data);
    });

    Map<String, String> headertest2 = {'Authorization': ''};
    Future.delayed(const Duration(seconds: 2), () async {
      final res = await http.get(Uri.parse('$baseUrl/check_token'), headers: headertest2);
      final data = json.decode(utf8.decode(res.bodyBytes));
      logger.i(data);
    });

    return data;
  }

  static sendGenres(List<String> genres) async {
    try {
      final res = await http.post(Uri.parse('$baseUrl/favoritegenres'),
          body: {
            'genre1': genres[0],
            'genre2': genres[1],
            'genre3': genres[2],
          },
          headers: getHeader());
      // final data = res.body;
      final data = json.decode(utf8.decode(res.bodyBytes));
      logger.i(data);
      // Get.snackbar('send genres return value', data);
      return data;
    } catch (e) {
      logger.e(e);
      Get.snackbar('send genres return err', e.toString());
      saveLogToFile(e.toString());
    }
  }

  static sendMovies(List<String> movies) async {
    logger.i(movies);
    SelectionController selectionController = Get.find();
    try {
      final res = await http.post(Uri.parse('$baseUrl/favoritemovies2'),
          body: {
            'movie1': movies[0],
            'movie2': movies[1],
            'movie3': movies[2],
          },
          headers: getHeader());
      // final data = res.body;
      // logger.e(utf8.decode(res.bodyBytes));
      Map<String, dynamic> data = json.decode(utf8.decode(res.bodyBytes));
      logger.i(data);

      // selectionController.getResultMoviesPosterPath(data.values.toList());
      Get.snackbar('send movies return value', data.toString());
      return data;
    } catch (e) {
      logger.e(e);
      Get.snackbar('send movies return err', e.toString());
      // selectionController.getResultMoviesPosterPath(['가필드', '겨울왕국', '어바웃 타임']);
      saveLogToFile(e.toString());
    }
  }

  static login(id, password) async {
    // Get.toNamed(Routes.main);
    // return;
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: {
          'userId': id,
          'password': password,
        },
        headers: {
          'Authorization': "authorization",
        },
      );
      final data = json.decode(utf8.decode(res.bodyBytes));
      logger.i(data);
      Get.snackbar('login status', data.toString());
      return data;
    } catch (e) {
      logger.e(e.toString());
      Get.snackbar('login error', e.toString());
    }
    // return {
    //   'success': data['access_token'] != null,
    //   'accessToken': data['access_token'] ?? '',
    // };
  }

  static logout() async {
    try {
      // final res = await http.post(Uri.parse('$baseUrl/logout'), headers: getHeader());
      // final data = json.decode(utf8.decode(res.bodyBytes));
      // logger.i(data);
      // Get.snackbar('logout status', data.toString());
      // return data;
    } catch (e) {
      Get.snackbar('logout error', e.toString());
    }
  }

  static join(username, id, password) async {
    Get.snackbar('join start', 'join start');
    logger.i('$username, $id, $password');
    var res;
    try {
      res = await http.post(Uri.parse('$baseUrl/join'), body: {
        'userName': username,
        'userId': id,
        'password': password,
      }, headers: {
        'Authorization': "authorization",
      });
      final data = json.decode(utf8.decode(res.bodyBytes));
      logger.i(data);
      Get.snackbar('join status', data.toString());
      return data;
    } catch (e) {
      logger.e(e.toString());
      logger.e(utf8.decode(res.bodyBytes));
      Get.snackbar('join error', e.toString());
    }
    // return {
    //   'success': data['access_token'] != null,
    //   'accessToken': data['access_token'] ?? '',
    // };
  }

  static asdf() async {
    final res = await http.get(Uri.parse('$baseUrl/asdf'));
    final data = json.decode(utf8.decode(res.bodyBytes));
    logger.i(data);
  }

  static getUserInfo() async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/userinfo'), headers: getHeader());
      final data = json.decode(utf8.decode(res.bodyBytes));
      logger.i(data);
      return data;
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
