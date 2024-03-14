import 'package:flutter/material.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';

class ButtonViewFullWidth extends StatelessWidget {
  final Function() onClick;
  final String btnText;
  final EdgeInsetsGeometry? margin;

  ButtonViewFullWidth(
      {required this.onClick, required this.btnText, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.maxFinite,
      height: BUTTON_COMMON_HEIGHT,
      child: TextButton(
        onPressed: () {
          onClick();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(PRIMARY_COLOR),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(RADIUS_XLARGE),
                    side: const BorderSide(color: PRIMARY_COLOR)))),
        child: Text(
          btnText,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
