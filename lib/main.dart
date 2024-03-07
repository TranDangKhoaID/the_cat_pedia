import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:the_cat_pedia/app.dart';
import 'package:the_cat_pedia/controllers/detail_breed_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Get.put(DetailBreedController());
  runApp(const App());
}
