import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_cat_pedia/constants/images_constant.dart';

class CachedNetWorkImageWidget extends StatelessWidget {
  const CachedNetWorkImageWidget({
    super.key,
    required this.url,
    this.height,
    this.width,
  });
  final double? height;
  final double? width;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: Colors.grey,
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        ImagesConstant.cat,
        fit: BoxFit.cover,
      ),
    );
  }
}
