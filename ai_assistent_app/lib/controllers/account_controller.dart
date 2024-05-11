import 'package:ai_assistent_app/configs/api.dart';
import 'package:ai_assistent_app/configs/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountController extends GetxController {
  Rx<bool> isLoggedIn = false.obs;
  Rx<String> accessToken = ''.obs;
  Rx<String> error = ''.obs;

  TextEditingController iDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  GetStorage box = GetStorage();

  @override
  Future<void> onReady() async {
    initAuthentication();
    iDController.addListener(() {
      error.value = '';
    });
    passwordController.addListener(() {
      error.value = '';
    });
    usernameController.addListener(() {
      error.value = '';
    });
  }

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
      logger.i('${iDController.text}, ${passwordController.text}, ${usernameController.text},');
      if (iDController.text.isEmpty) {
        error.value = '아이디를 입력해주세요';
        logger.i(error.value);
      } else if (passwordController.text.isEmpty) {
        error.value = '비밀번호를 입력해주세요';
        logger.i(error.value);
      } else {
        final data = await AppAPI.login(iDController.text, passwordController.text);
        logger.i(data);
        if (data['success']) {
          isLoggedIn.value = true;
          Get.offAllNamed(Routes.main);
        } else {
          Get.back();
          if (data['error'] == 'ID_ERROR') {
            error.value = '등록된 아이디가 아닙니다.';
          } else if (data['error'] == 'PASSWORD_ERROR') {
            error.value = '비밀번호가 틀렸습니다';
          } else {
            error.value = '아이디 혹은 비밀번호가 틀렸습니다';
          }
        }
      }
    } catch (err) {
      Get.snackbar("login errorr", err.toString());
    }
  }

  Future<void> logout() async {
    try {
      isLoggedIn.value = false;
      deleteAccessToken();
      AppAPI.logout();
      Get.offAllNamed(Routes.main);
    } catch (err) {
      Get.snackbar("logout errorr", err.toString());
    }
  }

  Future<void> deleteAccessToken() async {
    try {
      box.remove('localAccessToken');
      accessToken.value = '';
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> join() async {
    try {
      if (usernameController.text.isEmpty) {
        error.value = '사용자 이름을 입력해주세요.';
      } else if (iDController.text.isEmpty) {
        error.value = '아이디를 입력해주세요.';
      } else if (passwordController.text.isEmpty) {
        error.value = '비밀번호를 입력해주세요.';
      } else {
        final data =
            await AppAPI.join(usernameController.text, iDController.text, passwordController.text);
        logger.i(data);
        Get.snackbar('join status', data.toString());
        if (data['success']) {
          isLoggedIn.value = true;
          Get.offAllNamed(Routes.main);
        } else {
          Get.back();
          Get.snackbar('join error', data.toString());
        }
      }
    } catch (err) {
      Get.snackbar("join errorr", err.toString());
    }
  }
}
