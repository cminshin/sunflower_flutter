import 'package:ai_assistent_app/configs/api.dart';
import 'package:ai_assistent_app/configs/colors.dart';
import 'package:ai_assistent_app/configs/routes.dart';
import 'package:ai_assistent_app/widgets/my_background.dart';
import 'package:ai_assistent_app/widgets/my_elevated_button.dart';
import 'package:ai_assistent_app/widgets/transformed_poster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          myBackground(),
          Container(),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Get Your All-Time favorite movies!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  myElevatedButton(() {
                    Get.toNamed(Routes.genresSelection);
                    AppAPI.login('rudah7815', "sodlfmadms0078@");
                  }, 'Start Now', AppColor.mainColor),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 2 / 5,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TransformedPoster(
                  angle: -15,
                  child: Image.asset(
                    'assets/images/movies/어바웃 타임-poster.jpg',
                    // width: MediaQuery.of(context).size.width * 0.26,
                    height: MediaQuery.of(context).size.width * 0.26,
                  ),
                ),
                TransformedPoster(
                  angle: 15,
                  child: Image.asset(
                    'assets/images/movies/비긴 어게인-poster.jpg',
                    // width: 400,
                    height: MediaQuery.of(context).size.width * 0.26,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
