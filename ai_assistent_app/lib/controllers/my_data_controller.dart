import 'package:ai_assistent_app/configs/api.dart';
import 'package:get/get.dart';

class MyDataController extends GetxController {

  String username = '';
  // 각 개인별로 어떤 데이터를 어떤 형태로 저장할 지 확인 필요
  // 일정, 수업, 알람, 교통수단? 등등 이런것들 저장할 포맷이랑
  // 주고받을 포맷 정해야 함
  // 2024.03.19
  // List<Map<> classes
  @override
  void onReady() {
    super.onReady();
    initRequeest();
  }

  Future<void> initRequeest() async {
    final res = await AppAPI.getUserInfo();

    try {

    }

  }
}
