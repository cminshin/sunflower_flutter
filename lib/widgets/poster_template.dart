import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_recommendation_front/configs/colors.dart';
import 'package:movie_recommendation_front/controllers/selection_controller.dart';
import 'package:movie_recommendation_front/widgets/my_changing_elevated_button.dart';

class PosterTemplate extends StatelessWidget {
  final String moviePosterPath;
  const PosterTemplate({super.key, required this.moviePosterPath});

  @override
  Widget build(BuildContext context) {
    double posterWidth = MediaQuery.of(context).size.width / 8;
    SelectionController selectionController = Get.find();
    String title = moviePosterPath.split('/')[1].split('.')[0];
    return SizedBox(
      width: posterWidth < 230 ? posterWidth : 230,
      height: posterWidth * 1.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              child: Image.asset(
            'assets/images/movies/posters/$moviePosterPath',
            fit: BoxFit.cover,
          )),
          // SizedBox(height: posterWidth * 0.1),
          Obx(() => myChangingButton(() {
                if (selectionController.selectedMovies.contains(title)) {
                  selectionController.selectedMovies.remove(title);
                } else if (selectionController.selectedMovies.length >= 3) {
                  // 추가 안되어야 함
                } else {
                  selectionController.selectedMovies.add(title);
                }
              },
                  ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          selectionController.selectedMovies.contains(title)
                              ? AppColor.mainColor
                              : AppColor.greyColor)),
                  Text(title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: selectionController.selectedMovies.contains(title)
                              ? AppColor.whiteColor
                              : Colors.black)))),
        ],
      ),
    );
  }
}
