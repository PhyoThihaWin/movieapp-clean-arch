import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../resource/dimens.dart';

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

  double getScreenHeightBy(double times) {
    return MediaQuery.of(this).size.height / times;
  }

  double getScreenWidthBy(double times) {
    return MediaQuery.of(this).size.width / times;
  }

  /// loading dialog
  showLoaderDialog() {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(
                left: MARGIN_LARGE,
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
}

/// String Extension
extension StringFormat on String {
  String toAssetImage() => "assets/images/$this";

  String toAssetIcon() => "assets/icons/$this";

  String formatDate({
    String parseFormat = "yyyy-MM-dd",
    required String format,
  }) {
    DateTime parseDate = DateFormat(parseFormat).parse(this);
    var resultFormat = DateFormat(format);
    return resultFormat.format(parseDate);
  }
}

/// integer extension
extension NullIntExtension on int? {
  int get orZero => this ?? 0;

  int get toMMK => (this ?? 0) * 2100;
}

/// double extension
extension NullDoubleExtension on double? {
  double get orZero => this ?? 0;
}

/// boolean extension
extension NullBoolExtension on bool? {
  bool get orTrue => this ?? true;

  bool get orFalse => this ?? false;
}

/// list extension
extension ListNullSafetyExtension<T> on List<T?>? {
  List<T?> get orEmpty => this ?? [];

  List<T> get orEmptyObject =>
      this?.where((element) => element != null).toList().cast() ?? [];
}

/// iterable extension
extension IterableNullSafetyExtension<T> on Iterable<T>? {
  List<T> get orEmpty => this?.toList() ?? [];
}

/// [Color] extension
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
