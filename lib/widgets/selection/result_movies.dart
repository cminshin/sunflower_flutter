import 'dart:ui';

import 'package:movie_recommendation_front/configs/colors.dart';
import 'package:movie_recommendation_front/configs/movies.dart';
import 'package:movie_recommendation_front/controllers/selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultMovies extends StatelessWidget {
  const ResultMovies({super.key});

  @override
  Widget build(BuildContext context) {
    SelectionController selectionController = Get.find();
    const double posterWidth = 150;

    return SizedBox(
      height: posterWidth * 1.5 + 65, // 이미지 높이 + 텍스트 간격
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
          },
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // 가로 스크롤 가능하도록 설정
          shrinkWrap: true, // 리스트의 크기를 자식 위젯에 맞게 축소
          itemCount: selectionController.resultMoviesPath.length, // 영화 리스트의 길이만큼 아이템 생성
          itemBuilder: (context, index) {
            String title =
                selectionController.resultMoviesPath[index].split('/').last.split('-').first;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    width: posterWidth, // 각 아이템의 너비를 지정
                    child: Image.asset(
                      selectionController.resultMoviesPath[index],
                      width: posterWidth,
                      height: posterWidth * 1.5, // 포스터의 세로 길이를 조절할 수 있음
                      fit: BoxFit.cover, // 이미지를 가능한 크게 표시하되 비율 유지
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        // print('title : $title');
                        // print(selectionController.selectedMovies.toList().toString());
                        // if (selectionController.selectedMovies.contains(title)) {
                        //   selectionController.selectedMovies.remove(title);
                        // } else if (selectionController.selectedMovies.length >= 3) {
                        //   // 추가 안되어야 함
                        // } else {
                        //   selectionController.selectedMovies.add(title);
                        // }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          selectionController.selectedMovies.contains(title)
                              ? AppColor.mainColor
                              : AppColor.greyColor,
                        ),
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: selectionController.selectedMovies.contains(title)
                              ? AppColor.whiteColor
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
