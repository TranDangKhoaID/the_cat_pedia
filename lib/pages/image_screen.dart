import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:gap/gap.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_cat_pedia/heplers/admob_hepler.dart';
import 'package:the_cat_pedia/widgets/cached_network_image.dart';

class ImageScreen extends StatefulWidget {
  final String? img;

  const ImageScreen({
    super.key,
    required this.img,
  });

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  //AdmonHelper admonHelper = AdmonHelper();

  @override
  void initState() {
    super.initState();
    //admonHelper.createImageInterad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: CachedNetWorkImageWidget(
          url: widget.img.toString(),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: AdWidget(
          ad: AdmonHelper.getBannerImageAd()..load(),
          key: UniqueKey(),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back),
      //   onPressed: () {
      //     admonHelper.showImageInterad();
      //     Navigator.of(context).pop();
      //   },
      // ),
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: [
        IconButton(
          icon: const Icon(Icons.download),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              },
            );
            FileDownloader.downloadFile(
              url: widget.img.toString(),
              onDownloadCompleted: (path) {
                Navigator.pop(context);
                EasyLoading.showToast('downloaded success', dismissOnTap: true);
              },
            );
          },
        ),
        const Gap(10),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            Share.share(widget.img.toString());
          },
        ),
        const Gap(10),
      ],
    );
  }
}
