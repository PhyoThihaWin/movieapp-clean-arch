import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/theme/resource/colors.dart';
import 'package:movieapp_clean_arch/utils/context_ext.dart';

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
          : Icon(
              Icons.favorite_border,
              color: context.getColorScheme().onSurface,
            ),
    );
  }
}
