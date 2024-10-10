import 'package:movieapp_clean_arch/domain/general/localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_page_provider.g.dart';

@riverpod
class LocaleCode extends _$LocaleCode {
  @override
  String build() {
    return Localization.ENGLISH;
  }

  void update(String localeCode) => state = localeCode;
}
