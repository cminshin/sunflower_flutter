import 'package:movie_recommendation_front/configs/api.dart';
import 'package:movie_recommendation_front/configs/colors.dart';
import 'package:movie_recommendation_front/configs/routes.dart';
import 'package:movie_recommendation_front/controllers/selection_controller.dart';
import 'package:movie_recommendation_front/widgets/loading_widget.dart';
import 'package:movie_recommendation_front/widgets/my_background.dart';
import 'package:movie_recommendation_front/widgets/my_elevated_button.dart';
import 'package:movie_recommendation_front/widgets/selection/genres_selection.dart';
import 'package:movie_recommendation_front/widgets/selection/movies_selection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesSelectionScreen extends StatelessWidget {
  const MoviesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SelectionController selectionController = Get.find();

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
              selectionController.clearSelectedValues();
            },
          ),
        ),
        body: Obx(
          () => Stack(
            children: [
              myBackground(),
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'Select Your Favorite 3 Movies!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const MoviesSelection(),
                      const SizedBox(height: 60),
                      myElevatedButton(() async {
                        if (selectionController.selectedMovies.length == 3) {
                          Get.dialog(const LoadingWidget());
                          await selectionController.getResultMoviesPosterPath();
                          Future.delayed(const Duration(seconds: 1), () {
                            Get.toNamed(Routes.resultScreen);
                          });
                        } else {
                          // 3개 이하로 선택된 경우, 아무것도 하지 않는다
                        }
                      },
                          'Send',
                          selectionController.selectedMovies.length < 3
                              ? AppColor.greyColor
                              : AppColor.mainColor),
                    ],
                  ),
                ),
              ),

              // Obx(() => const GenresSelection()),
            ],
          ),
        ));
  }
}
