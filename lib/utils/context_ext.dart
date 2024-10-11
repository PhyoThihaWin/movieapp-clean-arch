import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/resource/dimens.dart';

/// Context Extension
extension PageNavigator on BuildContext {
  void next(T) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => T));
  }

  void nextRemove(T) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(
          builder: (context) => T,
        ),
        (route) => false);
  }

  void popBack() {
    Navigator.pop(this);
  }

  /// loading dialog
  showLoaderDialog() {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(
                left: Dimens.MARGIN_LARGE,
              ),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: this,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // go_router
  void navigate(String location, {Object? extra}) {
    kIsWeb ? go(location, extra: extra) : push(location, extra: extra);
  }

  void navigateBack(String location) => kIsWeb ? go(location) : popBack();

  double getScreenHeightBy(double times) =>
      MediaQuery.of(this).size.height / times;

  double getScreenWidthBy(double times) =>
      MediaQuery.of(this).size.width / times;

  ThemeData getTheme() => Theme.of(this);

  ColorScheme getColorScheme() => Theme.of(this).colorScheme;
}
