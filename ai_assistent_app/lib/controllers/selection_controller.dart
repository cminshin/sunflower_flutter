import 'package:get/get.dart';

class SelectionController extends GetxController {
  List<String> genres = ['액션', '범죄', '스릴러', '로맨스', '코미디', '스포츠', '음악', '멜로', 'SF', '공포'];
  RxList<String> selectedGenres = <String>[].obs;
  RxList<String> selectedMovies = <String>[].obs;
  Rx<bool> genreSend = false.obs;
}
