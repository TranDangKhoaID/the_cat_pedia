import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:gap/gap.dart';
import 'package:share_plus/share_plus.dart';

class ImageScreen extends StatelessWidget {
  final String? img;

  const ImageScreen({
    super.key,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Image.network(
          img.toString(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
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
              url: img.toString(),
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
            Share.share(img.toString());
          },
        ),
        const Gap(10),
      ],
    );
  }
}
