import 'package:flutter/material.dart';

class FavoriteIconView extends StatelessWidget {
  const FavoriteIconView(
      {super.key, required this.isFavorite, required this.onTap});

  final bool isFavorite;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Icon(
        Icons.favorite,
        color: isFavorite ? Colors.red : Colors.white,
      ),
    );
  }
}
