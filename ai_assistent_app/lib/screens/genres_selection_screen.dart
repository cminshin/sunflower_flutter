import 'package:ai_assistent_app/configs/api.dart';
import 'package:ai_assistent_app/configs/colors.dart';
import 'package:ai_assistent_app/configs/routes.dart';
import 'package:ai_assistent_app/controllers/selection_controller.dart';
import 'package:ai_assistent_app/widgets/my_background.dart';
import 'package:ai_assistent_app/widgets/my_elevated_button.dart';
import 'package:ai_assistent_app/widgets/selection/genres_selection.dart';
import 'package:ai_assistent_app/widgets/selection/movies_selection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenresSelectionScreen extends StatelessWidget {
  const GenresSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SelectionController selectionController = Get.find();

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(() => Stack(
        children: [
          myBackground(),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Select Your Favorite 3 Genres!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                const GenresSelection(),
                  const SizedBox(height: 60),
                  myElevatedButton(() {
                    if (selectionController.selectedGenres.length == 3) {
                      // AppAPI.sendGenres3(selectionController.selectedGenres);
                      print('genre send');
                      Get.toNamed(Routes.moviesSelection);
                    } else {
                      // 3개 이하로 선택된 경우, 아무것도 하지 않는다
                    }
                  }, 'Send', selectionController.selectedGenres.length < 3 ? AppColor.greyColor : AppColor.mainColor),
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
