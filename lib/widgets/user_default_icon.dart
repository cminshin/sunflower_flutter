import 'dart:math';
import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.yellow,
  ];

  final Random random = Random();

  UserIcon({super.key});

  Color getRandomColor() {
    return colors[random.nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: getRandomColor(),
      ),
      child: const Icon(
        Icons.person,
        color: Colors.white,
      ),
    );
  }
}
