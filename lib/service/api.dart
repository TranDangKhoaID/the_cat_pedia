import 'dart:io';

class API {
  static String baseUrl = 'https://api.thecatapi.com/v1/';
  static String apiKey =
      'live_vON0n0oRCLWo7yIQnMmOSzEvUkUpg1fP1EpTdSBEjHFlkNNFnAyorvdbSwKQEI15';
  static Map<String, String> authheader = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    'x-api-key': apiKey,
  };
  static String getBreeds = "${baseUrl}breeds";

  static String getImageID({
    required imagesID,
  }) {
    return "$baseUrl" "images/$imagesID";
  }

  static String getImageByBreedID({
    required String breedID,
  }) {
    if (breedID.isNotEmpty) {
      return "$baseUrl" "images/search?&breed_ids=$breedID";
    } else {
      return "";
    }
  }

  static String get10ImageByBreedID({
    required String breedID,
  }) {
    if (breedID.isNotEmpty) {
      return "$baseUrl" "images/search?limit=10&breed_ids=$breedID";
    } else {
      return "";
    }
  }

  static String get10ImagesRandom = "${baseUrl}images/search?limit=10";
}
