import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class AppMovies {
  static List<List<String>> movies = [];
  static List<String> genres = [
    "가족",
    "공포",
    "다큐멘터리",
    "드라마",
    "로맨스",
    "모험",
    "범죄",
    "애니메이션",
    "액션",
    "역사",
    "음악",
    "코미디",
    "판타지",
    "SF"
  ];

  static void loadMovieImages() async {
    for (String genre in genres) {
      final String directory = 'assets/images/movies/posters/$genre';
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      final List<String> paths =
          manifestMap.keys.where((String key) => key.contains(directory)).toList();

      List<String> movieNames = [];
      for (var path in paths) {
        final parts = path.split('/');
        final movieName = parts[parts.length - 1].split('-').first;
        movieNames.add(movieName);
      }

      movies.add(movieNames); // 각 장르에 대한 영화 이름 배열을 movies 배열에 추가
    }
    // int i = 0;
    // for (List<String> mov in movies) {
    // logger.i(genres[i++]);
    // logger.i(mov);
    // }
  }
}
