import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String image;
  final Color? color;

  const SvgIcon(this.image, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/icons/$image",
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null);
  }
}

class SvgImage extends StatelessWidget {
  final String image;
  final Color? color;

  const SvgImage(this.image, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/images/$image",
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null);
  }
}
