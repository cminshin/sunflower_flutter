import 'package:ai_assistent_app/controllers/account_controller.dart';
import 'package:ai_assistent_app/controllers/selection_controller.dart';
import 'package:ai_assistent_app/controllers/my_data_controller.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyDataController());
    Get.put(AccountController());
    Get.put(SelectionController());
  }
}
