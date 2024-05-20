import 'package:flutter/material.dart';

Widget myChangingButton(
  onPressed,
  style,
  child,
) {
  return ElevatedButton(
    onPressed: onPressed,
    style: style,
    child: child,
  );
}
