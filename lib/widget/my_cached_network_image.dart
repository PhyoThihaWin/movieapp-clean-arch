import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const MyCachedNetworkImage(
      {required this.imageUrl,
      super.key,
      this.width = null,
      this.height = null});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Container(color: Colors.grey),
      errorWidget: (context, url, error) => Container(color: Colors.grey),
      fadeInDuration: const Duration(milliseconds: 400),
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
