import 'dart:convert';

import 'package:ai_assistent_app/controllers/account_controller.dart';
import 'package:ai_assistent_app/controllers/selection_controller.dart';
import 'package:ai_assistent_app/logs/make_logs.dart';
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
        'Authorization': 'Bearer : $token',
      };
    }
  }

  static checkAccessToken(String accessToken) async {
    final res = await http.post(Uri.parse('/check_token'),
        body: {
          'token': accessToken,
        },
        headers: getHeader());
    final data = json.decode(utf8.decode(res.bodyBytes));
    logger.i(data);
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
    SelectionController selectionController = Get.find();
    try {
      final res = await http.post(Uri.parse('$baseUrl/favoritemovies'),
          body: {
            'movie1': movies[0],
            'movie2': movies[1],
            'movie3': movies[2],
          },
          headers: getHeader());
      // final data = res.body;
      Map<String, String> data = json.decode(utf8.decode(res.bodyBytes));
      logger.i(data);
      selectionController.getResultMoviesPosterPath(data.values.toList());
      // Get.snackbar('send movies return value', data);
      return data;
    } catch (e) {
      logger.e(e);
      Get.snackbar('send movies return err', e.toString());
      selectionController.getResultMoviesPosterPath(['파묘', '비긴 어게인', '어바웃 타임']);
      saveLogToFile(e.toString());
    }
  }

  static login(id, password) async {
    Get.snackbar('login start', 'login start');
    try {
      final res = await http.post(Uri.parse('$baseUrl/login'), body: {
        'id': id,
        'password': password,
      });
      final data = json.decode(utf8.decode(res.bodyBytes));
      logger.i(data);
      Get.snackbar('login status', data.toString());
      return data;
    } catch (e) {
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
    try {
      final res = await http.post(Uri.parse('$baseUrl/join'), body: {
        'username': username,
        'id': id,
        'password': password,
      });
      final data = json.decode(utf8.decode(res.bodyBytes));
      logger.i(data);
      Get.snackbar('join status', data.toString());
      return data;
    } catch (e) {
      Get.snackbar('join error', e.toString());
    }
    // return {
    //   'success': data['access_token'] != null,
    //   'accessToken': data['access_token'] ?? '',
    // };
  }
}
