import 'package:flutter/material.dart';

class TransformedPoster extends StatelessWidget {
  final Widget child;
  final double angle;

  const TransformedPoster(
      {super.key, required this.child, required this.angle});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * (3.14 / 180),
      child: child,
    );
  }
}
