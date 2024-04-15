import 'package:ai_assistent_app/configs/movies.dart';
import 'package:get/get.dart';

class SelectionController extends GetxController {
  List<String> genres = ['액션', '범죄', '스릴러', '로맨스', '코미디', '스포츠', '음악', '멜로', 'SF', '공포'];
  RxList<String> selectedGenres = <String>[].obs;
  RxList<String> selectedMovies = <String>[].obs;

  List<String> resultMoviesPath = [];
  Rx<bool> genreSend = false.obs;

  void getResultMoviesPosterPath(List<String> movies) {
    for (String movieName in movies) {
      for (String moviePath in AppMovies.movies) {
        // 영화 이름이 포함된 경로를 찾으면 해당 경로를 resultMoviesPath에 추가
        if (moviePath.contains(movieName)) {
          resultMoviesPath.add(moviePath);
          print('find $movieName');
          break; // 일치하는 포스터를 찾았으므로 다음 선택된 영화로 이동
        }
      }
    }
    print(resultMoviesPath.toString());
  }

  void clearSelectedValues() {
    selectedGenres.clear();
    selectedMovies.clear();
    resultMoviesPath.clear();
  }
}
