import 'package:movie_recommendation_front/configs/colors.dart';
import 'package:movie_recommendation_front/controllers/account_controller.dart';
import 'package:movie_recommendation_front/widgets/my_background.dart';
import 'package:movie_recommendation_front/widgets/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

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
                      controller: accountController.usernameController,
                      decoration: InputDecoration(
                        hintText: '사용자 이름을 입력하세요.',
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
                    accountController.join();
                  }, '회원가입', AppColor.mainColor),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
