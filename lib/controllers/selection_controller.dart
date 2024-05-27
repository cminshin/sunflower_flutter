import 'dart:math';

import 'package:movie_recommendation_front/configs/api.dart';
import 'package:movie_recommendation_front/configs/movies.dart';
import 'package:get/get.dart';

class SelectionController extends GetxController {
  List<String> genres = AppMovies.genres;
  // List<String> genres = ['액션', '범죄', '스릴러', '로맨스', '코미디', '스포츠', '음악', '멜로', 'SF', '공포'];
  RxList<String> selectedGenres = <String>[].obs;
  RxList<String> selectedMovies = <String>[].obs;

  List<String> exampleMoviesPath = [];
  List<List<String>> resultMoviesPath = [];
  // Iterable resultMoviesPath = [
  //   ["극한직업", "https://image.tmdb.org/t/p/original/jbHNkNydiZstlqhhBSvG19lm4NL.jpg"],
  //   ["극한직업", "https://image.tmdb.org/t/p/original/jbHNkNydiZstlqhhBSvG19lm4NL.jpg"],
  //   ["극한직업", "https://image.tmdb.org/t/p/original/jbHNkNydiZstlqhhBSvG19lm4NL.jpg"],
  //   ["극한직업", "https://image.tmdb.org/t/p/original/jbHNkNydiZstlqhhBSvG19lm4NL.jpg"],
  //   ["극한직업", "https://image.tmdb.org/t/p/original/jbHNkNydiZstlqhhBSvG19lm4NL.jpg"],
  //   ["극한직업", "https://image.tmdb.org/t/p/original/jbHNkNydiZstlqhhBSvG19lm4NL.jpg"],
  //   ["극한직업", "https://image.tmdb.org/t/p/original/jbHNkNydiZstlqhhBSvG19lm4NL.jpg"],
  //   ["극한직업", "https://image.tmdb.org/t/p/original/jbHNkNydiZstlqhhBSvG19lm4NL.jpg"],
  //   ["극한직업", "https://image.tmdb.org/t/p/original/jbHNkNydiZstlqhhBSvG19lm4NL.jpg"],
  //   ["극한직업", "https://image.tmdb.org/t/p/original/jbHNkNydiZstlqhhBSvG19lm4NL.jpg"],
  //   ["극한직업", "https://image.tmdb.org/t/p/original/jbHNkNydiZstlqhhBSvG19lm4NL.jpg"],
  // ];
  Rx<bool> genreSend = false.obs;

  Future<void> getResultMoviesPosterPath() async {
    Map<String, dynamic> data = await AppAPI.sendMovies(selectedMovies);
    resultMoviesPath.clear();
    data.forEach((key, value) {
      if (value[1] != "No poster available") {
        resultMoviesPath.add([value[0], value[1]]);
      }
    });
    return;
  }

  void getExampleMoviesPath() {
    for (String selectedGenre in selectedGenres) {
      for (int i = 0; i < 14; i++) {
        if (AppMovies.genres[i] == selectedGenre) {
          for (String mv in AppMovies.movies[i]) {
            String tmp = '${AppMovies.genres[i]}/$mv';
            exampleMoviesPath.add(tmp);
          }
          break;
        }
      }
    }
    shuffleMovies(exampleMoviesPath);
  }

  void shuffleMovies(List<String> moviesPath) {
    final random = Random();
    for (int i = 0; i < moviesPath.length - 1; i++) {
      int j = random.nextInt(i + 1);
      String temp = moviesPath[i];
      moviesPath[i] = moviesPath[j];
      moviesPath[j] = temp;
    }
  }

  void clearSelectedGenres() {
    selectedGenres.clear();
    exampleMoviesPath.clear();
  }

  void clearSelectedValues() {
    selectedGenres.clear();
    selectedMovies.clear();
    exampleMoviesPath.clear();
    resultMoviesPath.clear();
  }
}
