import 'package:flutter/material.dart';

class HorizontalSingleChildListView extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const HorizontalSingleChildListView(
      {super.key,
      required this.padding,
      required this.itemCount,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: Iterable<int>.generate(itemCount)
            .map((index) => itemBuilder(context, index))
            .toList(),
      ),
    );
  }
}
