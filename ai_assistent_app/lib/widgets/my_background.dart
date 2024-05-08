import 'package:ai_assistent_app/configs/colors.dart';
import 'package:flutter/material.dart';

Widget myBackground() {
  // return Expanded(child: Image.asset('assets/images/background.jpg'));
  // return Image.asset('assets/images/background_large.jpg');
  // return Image.asset('assets/images/background.jpg');

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 3,
        child: Container(
          color: AppColor.mainLightColor, // 위 영역 배경색
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          color: Colors.white, // 아래 영역 배경색
        ),
      ),
    ],
  );
}
