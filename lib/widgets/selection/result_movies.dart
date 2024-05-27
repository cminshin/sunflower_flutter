import 'dart:ui';

import 'package:movie_recommendation_front/controllers/selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_recommendation_front/widgets/result_poster_template.dart';

class ResultMovies extends StatelessWidget {
  const ResultMovies({super.key});

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
                children: selectionController.resultMoviesPath.map((movie) {
                  String title = movie[0];
                  String posterPath = movie[1];
                  return ResultPosterTemplate(moviePosterPath: posterPath, movieTitle: title);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
