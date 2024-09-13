import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/resource/colors.dart';

class FavoriteIconView extends StatelessWidget {
  const FavoriteIconView(
      {super.key, required this.isFavorite, required this.onTap});

  final bool isFavorite;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: isFavorite
          ? const Icon(
              Icons.favorite,
              color: PRIMARY_COLOR,
            )
          : const Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
    );
  }
}
