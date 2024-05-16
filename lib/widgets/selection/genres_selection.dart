import 'package:movie_recommendation_front/configs/colors.dart';
import 'package:movie_recommendation_front/controllers/selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenresSelection extends StatelessWidget {
  const GenresSelection({super.key});

  @override
  Widget build(BuildContext context) {
    SelectionController selectionController = Get.find();
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true, // GridView를 SingleChildScrollView 안에서 사용할 때 필요
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // 가로로 5줄
          childAspectRatio: 3, // 아이템의 가로 세로 비율
          crossAxisSpacing: 10, // 아이템 가로 간격
          mainAxisSpacing: 10, // 아이템 세로 간격
        ),
        itemCount: selectionController.genres.length,
        itemBuilder: (context, index) {
          String genre = selectionController.genres[index];
          return Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (selectionController.selectedGenres.contains(genre)) {
                      selectionController.selectedGenres.remove(genre);
                    } else if (selectionController.selectedGenres.length >= 3) {
                      // 추가 안되어야 함
                    } else {
                      selectionController.selectedGenres.add(genre);
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(
                        screenWidth / 5 - 20, // 버튼의 가로 크기: 화면 너비를 5등분하여 20 간격을 제외한 크기
                        50, // 버튼의 세로 크기: 고정값
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      selectionController.selectedGenres.contains(genre)
                          ? AppColor.mainColor
                          : AppColor.greyColor,
                    ),
                  ),
                  child: Text(
                    genre,
                    style: TextStyle(
                      color: selectionController.selectedGenres.contains(genre)
                          ? AppColor.whiteColor
                          : Colors.black,
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
