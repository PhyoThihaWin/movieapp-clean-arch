import 'package:intl/intl.dart';

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

extension NullStringExtension on String? {
  String orEmpty() => this ?? "";
}

/// integer extension
extension NullIntExtension on int? {
  int orZero() => this ?? 0;
}

/// double extension
extension NullDoubleExtension on double? {
  double orZero() => this ?? 0;
}

/// boolean extension
extension NullBoolExtension on bool? {
  bool orTrue() => this ?? true;

  bool orFalse() => this ?? false;
}

/// list extension
extension ListNullSafetyExtension<T> on List<T?>? {
  List<T?> orEmpty() => this ?? [];
  List<T> orEmptyObject() =>
      this?.where((element) => element != null).toList().cast() ?? [];
}

/// iterable extension
extension IterableNullSafetyExtension<T> on Iterable<T>? {
  List<T> orEmpty() => this?.toList() ?? [];
}
