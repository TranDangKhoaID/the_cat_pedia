/*
test ad
Banner ads: "ca-app-pub-3940256099942544/6300978111"
Interstitial ads: "ca-app-pub-3940256099942544/1033173712"
Rewarded ads: "ca-app-pub-3940256099942544/5224354917"
Native ads: "ca-app-pub-3940256099942544/2247696110"
*/
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmonHelper {
  static String get bannerHomeUnit => 'ca-app-pub-8347334978438891/8007624519';
  static String get bannerCatUnit => 'ca-app-pub-8347334978438891/5611248236';
  static String get bannerImageUnit => 'ca-app-pub-8347334978438891/8373142947';
  static String get bannerSettingUnit =>
      'ca-app-pub-8347334978438891/1807734591';

  //int num_of_attempt_load = 0;

  static BannerAd getBannerHomeAd() {
    BannerAd bAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdmonHelper.bannerHomeUnit,
      listener: BannerAdListener(
        onAdLoaded: (ad) => debugPrint('Ad loaded'),
        onAdFailedToLoad: (ad, error) {
          debugPrint('Ad Failed');
          ad.dispose();
        },
        onAdOpened: (ad) => debugPrint('Ad Loaded'),
      ),
      request: const AdRequest(),
    );
    return bAd;
  }

  static BannerAd getBannerCatAd() {
    BannerAd bAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdmonHelper.bannerCatUnit,
      listener: BannerAdListener(
        onAdLoaded: (ad) => debugPrint('Ad loaded'),
        onAdFailedToLoad: (ad, error) {
          debugPrint('Ad Failed');
          ad.dispose();
        },
        onAdOpened: (ad) => debugPrint('Ad Loaded'),
      ),
      request: const AdRequest(),
    );
    return bAd;
  }

  static BannerAd getBannerImageAd() {
    BannerAd bAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdmonHelper.bannerImageUnit,
      listener: BannerAdListener(
        onAdLoaded: (ad) => debugPrint('Ad loaded'),
        onAdFailedToLoad: (ad, error) {
          debugPrint('Ad Failed');
          ad.dispose();
        },
        onAdOpened: (ad) => debugPrint('Ad Loaded'),
      ),
      request: const AdRequest(),
    );
    return bAd;
  }

  static BannerAd getBannerSettingAd() {
    BannerAd bAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdmonHelper.bannerSettingUnit,
      listener: BannerAdListener(
        onAdLoaded: (ad) => debugPrint('Ad loaded'),
        onAdFailedToLoad: (ad, error) {
          debugPrint('Ad Failed');
          ad.dispose();
        },
        onAdOpened: (ad) => debugPrint('Ad Loaded'),
      ),
      request: const AdRequest(),
    );
    return bAd;
  }

  //inititial ad
  InterstitialAd? _interstitialCatAd;
  InterstitialAd? _interstitialImageAd;

  static String get inititialCatUnit =>
      'ca-app-pub-8347334978438891/9620923231';
  static String get inititialImageUnit =>
      'ca-app-pub-8347334978438891/9429351540';

  void createCatInterad() {
    InterstitialAd.load(
      adUnitId: AdmonHelper.inititialCatUnit,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialCatAd = ad;
        },
        onAdFailedToLoad: (error) {
          _interstitialCatAd = null;
        },
      ),
    );
  }

  void showCatInterad() {
    if (_interstitialCatAd != null) {
      _interstitialCatAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          createCatInterad();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          debugPrint('$ad on ad failed $error');
          ad.dispose();
          createCatInterad();
        },
      );
      _interstitialCatAd!.show();
      _interstitialCatAd = null;
    } else {
      createCatInterad();
    }
  }

  void createImageInterad() {
    InterstitialAd.load(
      adUnitId: AdmonHelper.inititialImageUnit,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialImageAd = ad;
        },
        onAdFailedToLoad: (error) {
          _interstitialImageAd = null;
        },
      ),
    );
  }

  void showImageInterad() {
    if (_interstitialImageAd != null) {
      _interstitialImageAd!.fullScreenContentCallback =
          FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          createImageInterad();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          debugPrint('$ad on ad failed $error');
          ad.dispose();
          createImageInterad();
        },
      );
      _interstitialImageAd!.show();
      _interstitialImageAd = null;
    } else {
      createImageInterad();
    }
  }
}
