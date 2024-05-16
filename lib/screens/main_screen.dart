import 'package:movie_recommendation_front/configs/api.dart';
import 'package:movie_recommendation_front/configs/colors.dart';
import 'package:movie_recommendation_front/configs/routes.dart';
import 'package:movie_recommendation_front/controllers/account_controller.dart';
import 'package:movie_recommendation_front/widgets/my_background.dart';
import 'package:movie_recommendation_front/widgets/my_elevated_button.dart';
import 'package:movie_recommendation_front/widgets/transformed_poster.dart';
import 'package:movie_recommendation_front/widgets/user_default_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController accountController = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          myBackground(),
          Container(),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Get Your All-Time favorite movies!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Obx(() => accountController.isLoggedIn.value == true
                      ? myElevatedButton(() {
                          Get.toNamed(Routes.genresSelection);
                        }, '시작하기', AppColor.mainColor)
                      : myElevatedButton(() {
                          Get.toNamed(Routes.login);
                        }, '로그인', AppColor.mainColor))
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 2 / 5,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TransformedPoster(
                  angle: -15,
                  child: Image.asset(
                    'assets/images/movies/posters/SF/그래비티.jpg',
                    // 'assets/images/movies/어바웃 타임-poster.jpg',
                    // width: MediaQuery.of(context).size.width * 0.26,
                    height: MediaQuery.of(context).size.width * 0.26,
                  ),
                ),
                TransformedPoster(
                  angle: 15,
                  child: Image.asset(
                    'assets/images/movies/posters/SF/듄.jpg',
                    // width: 400,
                    height: MediaQuery.of(context).size.width * 0.26,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 10,
              right: 180,
              width: 100,
              height: 30,
              child: Obx(() => accountController.isLoggedIn.value == true
                  ? UserIcon()
                  : myElevatedButton(
                      () {
                        Get.toNamed(Routes.login);
                      },
                      "로그인",
                      AppColor.mainColor,
                    ))),
          // 여기 해결 필요
          Positioned(
              top: 10,
              right: 50,
              width: 100,
              height: 30,
              child: Obx(() => accountController.isLoggedIn.value == true
                  ? Container()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: AppColor.mainLightColor, width: 2),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.join);
                      },
                      child: Text("회원가입", style: TextStyle(color: AppColor.mainColor)),
                    )))
        ],
      ),
    );
  }
}
