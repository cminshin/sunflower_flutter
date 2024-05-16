import 'dart:math';

import 'package:movie_recommendation_front/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: changingLoadingWidget()));
  }
}

Widget changingLoadingWidget() {
  int random = Random().nextInt(4);
  switch (random) {
    case 1:
      return LoadingAnimationWidget.newtonCradle(color: AppColor.mainColor, size: 100);
    case 2:
      return LoadingAnimationWidget.staggeredDotsWave(color: AppColor.mainColor, size: 100);
    case 3:
      return LoadingAnimationWidget.fourRotatingDots(color: AppColor.mainColor, size: 100);
    case 4:
      return LoadingAnimationWidget.hexagonDots(color: AppColor.mainColor, size: 100);
    default:
      return LoadingAnimationWidget.hexagonDots(color: AppColor.mainColor, size: 100);
  }
}
