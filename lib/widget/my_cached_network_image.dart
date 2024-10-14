import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const MyCachedNetworkImage(
      {required this.imageUrl, super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Skeletonizer(
          enabled: true,
          child: Container(
            color: Colors.grey,
            height: height,
            width: width,
          )),
      errorWidget: (context, url, error) => Container(color: Colors.grey),
      fadeInDuration: const Duration(milliseconds: 0),
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
