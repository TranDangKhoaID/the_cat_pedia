import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:the_cat_pedia/models/image_breed_model.dart';
import 'package:the_cat_pedia/service/api.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class DetailBreedController extends GetxController {
  List<ImageBreedModel> images = <ImageBreedModel>[].obs;

  static DetailBreedController get instance => Get.find();

  Future<dynamic> getImageByBreedID({
    required breedID,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(API.get10ImageByBreedID(breedID: breedID)),
      );
      List<dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        for (var item in responseBody) {
          ImageBreedModel model = ImageBreedModel.fromJson(item);
          images.add(model);
        }
      } else {
        print('>>>error get image by breed id: something_went_wrong');
      }
    } catch (e) {
      print('>>>error get image by breed id: ${e.toString()}');
    }
    return null;
  }

  Future<void> launchUrlWWeb(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      EasyLoading.showError('Không thể mở ứng dụng $uri');
    }
  }

  Future<dynamic> launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Support',
        'body': 'Content',
      },
    );

    if (!await launchUrl(emailLaunchUri)) {
      EasyLoading.showError('Không thể mở ứng dụng email $emailLaunchUri');
    }
  }
}
