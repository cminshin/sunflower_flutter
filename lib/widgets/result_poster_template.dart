import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_recommendation_front/configs/colors.dart';
import 'package:movie_recommendation_front/controllers/selection_controller.dart';
import 'package:movie_recommendation_front/widgets/my_changing_elevated_button.dart';

class ResultPosterTemplate extends StatelessWidget {
  final String moviePosterPath;
  final String movieTitle;
  const ResultPosterTemplate({super.key, required this.moviePosterPath, required this.movieTitle});

  @override
  Widget build(BuildContext context) {
    double posterWidth = MediaQuery.of(context).size.width / 6;
    SelectionController selectionController = Get.find();
    return SizedBox(
      width: posterWidth < 230 ? posterWidth : 230,
      height: posterWidth * 1.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              child: Image.network(
            moviePosterPath,
            fit: BoxFit.cover,
          )),
          // SizedBox(height: posterWidth * 0.1),
          myChangingButton(
              () {},
              ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColor.mainColor)),
              Text(movieTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: AppColor.whiteColor))),
        ],
      ),
    );
  }
}
