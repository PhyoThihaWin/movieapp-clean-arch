import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/widget/my_cached_network_image.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCachedNetworkImage(
        width: 300,
        height: 600,
        imageUrl:
            "https://m.media-amazon.com/images/I/71xefrbhS8S._AC_SL1500_.jpg");
  }
}
