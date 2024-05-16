import 'package:movie_recommendation_front/configs/colors.dart';
import 'package:flutter/material.dart';

Widget myElevatedButton(onPressed, text, backgroundColor) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
    onPressed: onPressed,
    child: Text(text, style: TextStyle(color: AppColor.whiteColor)),
  );
}
