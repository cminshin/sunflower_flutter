import 'package:movie_recommendation_front/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: AppColor.mainColor,
        alignment: Alignment.center,
        child: Image.asset('assets/init-cat.png'),
      ),
    );
  }
}
