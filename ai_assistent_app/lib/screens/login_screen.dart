import 'package:ai_assistent_app/configs/colors.dart';
import 'package:ai_assistent_app/configs/routes.dart';
import 'package:ai_assistent_app/controllers/account_controller.dart';
import 'package:ai_assistent_app/widgets/my_background.dart';
import 'package:ai_assistent_app/widgets/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController accountController = Get.find();

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        // title: Text('로그인'),
      ),
      body: Stack(
        children: [
          myBackground(), // 배경 이미지
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth / 2, // 화면의 절반으로 설정
                    child: TextField(
                      controller: accountController.iDController,
                      decoration: InputDecoration(
                        hintText: '아이디를 입력하세요.',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.mainColor,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.mainColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: screenWidth / 2, // 화면의 절반으로 설정
                    child: TextField(
                      obscureText: true,
                      controller: accountController.passwordController,
                      decoration: InputDecoration(
                        hintText: '비밀번호를 입력하세요.',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.mainColor,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.mainColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(() => accountController.error.value.isEmpty
                      ? const SizedBox(height: 20)
                      : Container()),
                  Obx(
                    () => accountController.error.value.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              accountController.error.value,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.purple,
                              ),
                            ),
                          )
                        : Container(),
                  ),
                  myElevatedButton(() {
                    accountController.login();
                  }, '로그인', AppColor.mainColor),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.join);
                      // 회원가입 버튼 눌렀을 때의 동작 구현
                    },
                    child: Text(
                      '회원가입',
                      style: TextStyle(color: AppColor.mainColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
