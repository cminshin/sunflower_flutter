import 'package:ai_assistent_app/configs/api.dart';
import 'package:ai_assistent_app/configs/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountController extends GetxController {
  Rx<bool> isLoggedIn = false.obs;
  Rx<String> accessToken = ''.obs;
  Rx<String> error = ''.obs;

  TextEditingController loginPageEmailController = TextEditingController();
  TextEditingController loginPagePasswordController = TextEditingController();

  GetStorage box = GetStorage();

  Future<void> initAuthentication() async {
    try {
      String? localAccessToken = box.read('localAccessToken');

      if (localAccessToken == null || localAccessToken == '') {
        logout();
      } else {
        bool isValidate = await AppAPI.checkAccessToken(localAccessToken);
        if (isValidate) {
          isLoggedIn.value = true;
          accessToken.value = localAccessToken;
          Get.offNamed(Routes.main);
        } else {
          logout();
        }
      }
    } catch (err) {
      logout();
    }
  }

  Future<void> login() async {
    try {
      // login logic
      if (loginPageEmailController.text.isEmpty) {
        error.value = '아이디를 입력해주세요';
      } else if (loginPagePasswordController.text.isEmpty) {
        error.value = '비밀번호를 입력해주세요';
      } else {
        final data = await AppAPI.login(
            loginPageEmailController.text, loginPagePasswordController.text);
        logger.i(data);
        if (data['success']) {
          isLoggedIn.value = true;
          Get.offAllNamed(Routes.main);
        } else {
          Get.back();
          error.value = '아이디 혹은 비밀번호가 틀렸습니다';
        }
      }
    } catch (err) {}
  }

  Future<void> logout() async {
    try {
      isLoggedIn.value = false;
      deleteAccessToken();
      AppAPI.logout();
      Get.offAllNamed(Routes.login);
    } catch (err) {}
  }

  Future<void> deleteAccessToken() async {
    try {
      box.remove('localAccessToken');
      accessToken.value = '';
    } catch (e) {
      logger.e(e);
    }
  }
}
