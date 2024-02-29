import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImageScreen extends StatefulWidget {
  final String? img;
  // final void Function()? onDownload;
  // final void Function()? onShare;
  const ImageScreen({
    super.key,
    required this.img,
    // required this.onDownload,
    // required this.onShare,
  });

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Image.network(
          widget.img.toString(),
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
          onPressed: () {},
        ),
        const Gap(10),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {},
        ),
        const Gap(10),
      ],
    );
  }
}
