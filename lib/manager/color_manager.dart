import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static Color primary = Colors.orange.shade400;
}

Color generateRandomColor() {
  Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1.0,
  );
}
