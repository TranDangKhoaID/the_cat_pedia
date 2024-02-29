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

  // static String urlImageID({
  //   required String? imagesID,
  // }) {
  //   if (imagesID != null) {
  //     return "https://cdn2.thecatapi.com/images/O3btzLlsO.png";
  //   } else {
  //     return "https://cdn2.thecatapi.com/images/$imagesID.jpg";
  //   }
  // }

  static String get10ImagesRandom = "${baseUrl}images/search?limit=10";
}
