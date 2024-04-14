import 'package:ai_assistent_app/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: LoadingAnimationWidget.fourRotatingDots(
        color: AppColor.mainColor,
        size: 100,
      ),
    ));
  }
}

Widget fourRotatingDots() {
  return Container();
  // return LoadingAnimationWidget.fourRotatingDots(color: color, size: size)
}
