import 'package:movie_recommendation_front/controllers/account_controller.dart';
import 'package:movie_recommendation_front/controllers/selection_controller.dart';
import 'package:movie_recommendation_front/controllers/my_data_controller.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyDataController());
    Get.put(AccountController());
    Get.put(SelectionController());
  }
}
