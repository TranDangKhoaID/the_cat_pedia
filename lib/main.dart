import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_cat_pedia/app.dart';
import 'package:the_cat_pedia/controllers/detail_breed_controller.dart';

void main() {
  Get.put(DetailBreedController());
  runApp(const App());
}
