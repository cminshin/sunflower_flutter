import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class AppMovies {
  static List<String> movies = [];

  static void loadMovieImages() async {
    // assets/images/movies 폴더에 있는 모든 파일 가져오기
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final List<String> paths =
        manifestMap.keys.where((String key) => key.contains('assets/images/movies/')).toList();

    // 파일 경로에서 영화 이름 추출하여 movies 배열에 추가
    paths.forEach((path) {
      final parts = path.split('/');
      if (parts.length > 3) {
        final fileName = parts[parts.length - 1];
        final movieName = fileName.split('-').first.replaceAll('-', ' ');
        movies.add('assets/images/movies/$fileName');
      }
    });

    print(movies.toString());
  }
}
