import 'dart:ui';

import 'package:movie_recommendation_front/configs/colors.dart';
import 'package:movie_recommendation_front/configs/movies.dart';
import 'package:movie_recommendation_front/controllers/selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_recommendation_front/widgets/my_changing_elevated_button.dart';
import 'package:movie_recommendation_front/widgets/poster_template.dart';

class MoviesSelection extends StatelessWidget {
  const MoviesSelection({super.key});

  @override
  Widget build(BuildContext context) {
    SelectionController selectionController = Get.find();

    const double posterWidth = 150;

    return SizedBox(
      height: posterWidth * 2.5, // 이미지 높이 + 텍스트 간격
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
          },
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: selectionController.exampleMoviesPath.map((moviePoster) {
                  // String title = moviePoster.split('/')[1];
                  return PosterTemplate(moviePosterPath: moviePoster);
                  // return Column(
                  //   children: [
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width / 8 -
                  //           10.0, // 화면 너비를 8로 나누고 간격을 제외한 크기
                  //       height: 150.0, // 영화 포스터의 세로 크기
                  //       child: Image.asset(
                  //         'assets/images/movies/posters/$moviePoster',
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(top: 10),
                  //       child: myChangingButton(() {
                  //         if (selectionController.selectedMovies.contains(title)) {
                  //           selectionController.selectedMovies.remove(title);
                  //         } else if (selectionController.selectedMovies.length >= 3) {
                  //           // 추가 안되어야 함
                  //         } else {
                  //           selectionController.selectedMovies.add(title);
                  //         }
                  //       },
                  //           ButtonStyle(
                  //               backgroundColor: MaterialStateProperty.all<Color>(
                  //                   selectionController.selectedMovies.contains(title)
                  //                       ? AppColor.mainColor
                  //                       : AppColor.greyColor)),
                  //           Text(title,
                  //               style: TextStyle(
                  //                   color: selectionController.selectedMovies.contains(title)
                  //                       ? AppColor.whiteColor
                  //                       : Colors.black))),
                  //     ),
                  //   ],
                  // );
                }).toList(),
              ),
            ],
          ),
        ),
        // child: ListView.builder(
        //   scrollDirection: Axis.horizontal, // 가로 스크롤 가능하도록 설정
        //   shrinkWrap: true, // 리스트의 크기를 자식 위젯에 맞게 축소
        //   itemCount: AppMovies.movies.length, // 영화 리스트의 길이만큼 아이템 생성
        //   itemBuilder: (context, index) {
        //     // 영화 제목을 추출하기 위해 이미지 경로를 '/'로 분할하고 마지막 요소를 사용
        //     String title = AppMovies.movies[0][index];

        //     return Obx(() => Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: Column(
        //             children: [
        //               SizedBox(
        //                 width: posterWidth, // 각 아이템의 너비를 지정
        //                 child: Image.asset(
        //                   'assets/images/movies/posters/${AppMovies.genres[0]}/${AppMovies.movies[0][index]}',
        //                   width: posterWidth,
        //                   height: posterWidth * 1.5, // 포스터의 세로 길이를 조절할 수 있음
        //                   fit: BoxFit.cover, // 이미지를 가능한 크게 표시하되 비율 유지
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 10),
        //                 child: ElevatedButton(
        //                   onPressed: () {
        //                     print('title : $title');
        //                     print(selectionController.selectedMovies.toList().toString());
        //                     if (selectionController.selectedMovies.contains(title)) {
        //                       selectionController.selectedMovies.remove(title);
        //                     } else if (selectionController.selectedMovies.length >= 3) {
        //                       // 추가 안되어야 함
        //                     } else {
        //                       selectionController.selectedMovies.add(title);
        //                     }
        //                   },
        //                   style: ButtonStyle(
        //                     backgroundColor: MaterialStateProperty.all<Color>(
        //                       selectionController.selectedMovies.contains(title)
        //                           ? AppColor.mainColor
        //                           : AppColor.greyColor,
        //                     ),
        //                   ),
        //                   child: Text(
        //                     title,
        //                     style: TextStyle(
        //                       color: selectionController.selectedMovies.contains(title)
        //                           ? AppColor.whiteColor
        //                           : Colors.black,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ));
        //   },
        // ),
      ),
    );
  }
}
