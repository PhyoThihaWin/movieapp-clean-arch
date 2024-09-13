import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final double height;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const HorizontalListView(
      {super.key,
      required this.padding,
      required this.itemCount,
      required this.itemBuilder,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
