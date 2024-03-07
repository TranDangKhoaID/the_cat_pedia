import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_cat_pedia/models/breed_model.dart';
import 'package:the_cat_pedia/models/image_breed_model.dart';
import 'package:the_cat_pedia/service/api.dart';
import 'package:http/http.dart' as http;

class BreedController extends GetxController {
  //var breed = BreedModel().obs;
  RxList<BreedModel> breeds = <BreedModel>[].obs;
  RxList<ImageBreedModel> images = <ImageBreedModel>[].obs;
  RxList<String> urlImages = <String>[].obs;
  //RxList<BreedModel> searchedBreeds = <BreedModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    get10ImageRandom();
    getBreed();
    super.onInit();
  }

  Future<dynamic> getBreed() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(API.getBreeds));
      //Map<String, dynamic> responseBody = json.decode(response.body);
      List<dynamic> responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        isLoading.value = false;
        //BreedModel model = BreedModel.fromJson(responseBody);
        for (var item in responseBody) {
          BreedModel model = BreedModel.fromJson(item);
          await getImageByBreedID(breedID: model.id.toString(), breed: model);
          breeds.add(model);
        }
      } else {
        isLoading.value = false;
        debugPrint('>>>error breed controller: something_went_wrong');
        // ShowToastDialog.showToast("something_went_wrong".tr);
        // throw Exception("failed_to_load_album".tr);
      }
    } on TimeoutException catch (e) {
      //ShowToastDialog.closeLoader();
      debugPrint('>>>error breed controller: ${e.message.toString()}');
      // ShowToastDialog.showToast(e.message.toString());
    } on SocketException catch (e) {
      //ShowToastDialog.closeLoader();
      debugPrint('>>>error breed controller: ${e.message.toString()}');
      // ShowToastDialog.showToast(e.message.toString());
    } on Error catch (e) {
      //ShowToastDialog.closeLoader();
      debugPrint('>>>error breed controller: ${e.toString()}');
      // ShowToastDialog.showToast(e.toString());
    } catch (e) {
      //ShowToastDialog.closeLoader();
      debugPrint('>>>error breed controller: ${e.toString()}');
      // ShowToastDialog.showToast(e.toString());
    }
    return null;
  }

  Future<dynamic> getImageByBreedID({
    required String breedID,
    required BreedModel breed,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(API.getImageByBreedID(breedID: breedID)),
      );
      List<dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        for (var item in responseBody) {
          String url = item["url"];
          breed.url = url;
        }
      } else {
        debugPrint('>>>error get image by breed id: something_went_wrong');
      }
    } catch (e) {
      debugPrint('>>>error get image by breed id: ${e.toString()}');
    }
    return null;
  }

  Future<dynamic> get10ImageRandom() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(API.get10ImagesRandom));
      //Map<String, dynamic> responseBody = json.decode(response.body);
      List<dynamic> responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        isLoading.value = false;
        for (var item in responseBody) {
          ImageBreedModel model = ImageBreedModel.fromJson(item);
          images.add(model);
        }

        //breeds.add(model);
      } else {
        isLoading.value = false;
        debugPrint('>>>error breed controller: something_went_wrong');
        // ShowToastDialog.showToast("something_went_wrong".tr);
        // throw Exception("failed_to_load_album".tr);
      }
    } on TimeoutException catch (e) {
      //ShowToastDialog.closeLoader();
      debugPrint('>>>error breed controller: ${e.message.toString()}');
      // ShowToastDialog.showToast(e.message.toString());
    } on SocketException catch (e) {
      //ShowToastDialog.closeLoader();
      debugPrint('>>>error breed controller: ${e.message.toString()}');
      // ShowToastDialog.showToast(e.message.toString());
    } on Error catch (e) {
      //ShowToastDialog.closeLoader();
      debugPrint('>>>error breed controller: ${e.toString()}');
      // ShowToastDialog.showToast(e.toString());
    } catch (e) {
      //ShowToastDialog.closeLoader();
      debugPrint('>>>error breed controller: ${e.toString()}');
      // ShowToastDialog.showToast(e.toString());
    }
    return null;
  }
}
