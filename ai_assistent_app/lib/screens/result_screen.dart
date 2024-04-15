import 'package:ai_assistent_app/configs/api.dart';
import 'package:ai_assistent_app/configs/colors.dart';
import 'package:ai_assistent_app/configs/routes.dart';
import 'package:ai_assistent_app/controllers/selection_controller.dart';
import 'package:ai_assistent_app/widgets/loading_widget.dart';
import 'package:ai_assistent_app/widgets/my_background.dart';
import 'package:ai_assistent_app/widgets/my_elevated_button.dart';
import 'package:ai_assistent_app/widgets/selection/genres_selection.dart';
import 'package:ai_assistent_app/widgets/selection/movies_selection.dart';
import 'package:ai_assistent_app/widgets/selection/result_movies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

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
      body: Stack(
        children: [
          myBackground(),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Result',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const ResultMovies(),
                  const SizedBox(height: 60),
                  myElevatedButton(() {
                    print('restart');
                    selectionController.clearSelectedValues();
                    Get.dialog(const LoadingWidget());
                    Future.delayed(const Duration(seconds: 2), () {
                      Get.toNamed(Routes.main);
                    });
                  }, 'Restart', AppColor.mainColor),
                ],
              ),
            ),
          ),

          // Obx(() => const GenresSelection()),
        ],
      ),
    );
  }
}
