import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp_clean_arch/domain/general/localization.dart';
import 'package:movieapp_clean_arch/generated/locale_keys.g.dart';
import 'package:movieapp_clean_arch/page/home/home_page.dart';
import 'package:movieapp_clean_arch/page/profile/profile_page_provider.dart';
import 'package:movieapp_clean_arch/theme/resource/colors.dart';
import 'package:movieapp_clean_arch/theme/theme_provider.dart';
import 'package:movieapp_clean_arch/utils/context_ext.dart';
import 'package:movieapp_clean_arch/utils/primitive_ext.dart';
import 'package:movieapp_clean_arch/widget/space_widget.dart';
import 'package:movieapp_clean_arch/widget/svg_image.dart';

import '../../theme/resource/dimens.dart';
import '../../theme/resource/strings.dart';
import '../../widget/button_view_fullwidth.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          const ProfileInfoSectionView(),
          const VerticalSpacer(Dimens.MARGIN_XXXLARGE),
          ProfileMenuItemView(
            text: LocaleKeys.txtMyTicket.tr(),
            icon: "ic_ticket_setting.svg",
            onClick: () {},
          ),
          Divider(
            color: Colors.grey.withOpacity(0.3),
          ),
          ProfileMenuItemView(
            text: LocaleKeys.txtPaymentHistory.tr(),
            icon: "ic_cart_setting.svg",
            onClick: () {},
          ),
          Divider(
            color: Colors.grey.withOpacity(0.3),
          ),
          ProfileMenuItemView(
            text: LocaleKeys.txtChangeLanguage.tr(),
            icon: "ic_translate_setting.svg",
            onClick: () {
              ref
                  .watch(localeCodeProvider.notifier)
                  .update(context.locale.languageCode);
              showLanguageBottomSheet(context);
            },
          ),
          Divider(color: Colors.grey.withOpacity(0.3)),
          ProfileMenuItemView(
            text: LocaleKeys.txtChangePassword.tr(),
            icon: "ic_lock_setting.svg",
            onClick: () {},
          ),
          Divider(color: Colors.grey.withOpacity(0.3)),
          ProfileMenuItemWithToggle(
            text: LocaleKeys.txtDarkMode.tr(),
            icon: "ic_biometric_setting.svg",
            toggle: ref.watch(currentThemeModeProvider).value == ThemeMode.dark,
            onToggle: (value) {
              ref.read(currentThemeModeProvider.notifier).updateThemeMode();
            },
          ),
        ],
      ),
    );
  }

  ///  Show Language changed bottom sheet
  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return Consumer(builder: (context, ref, child) {
          var localeCode = ref.watch(localeCodeProvider);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  height: 4,
                  width: 30,
                  margin: const EdgeInsets.only(top: Dimens.MARGIN_20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.RADIUS_MEDIUM),
                      color: Colors.grey.shade400),
                ),
              ),
              const VerticalSpacer(Dimens.MARGIN_LARGE),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.MARGIN_MEDIUM_2),
                child: SectionTitleText(localeCode == Localization.ENGLISH
                    ? txtChooseLangauge
                    : txtChooseLangaugeMM),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.MARGIN_MEDIUM_2),
                child: Text(localeCode == Localization.ENGLISH
                    ? txtLanguageChangeDesc
                    : txtLanguageChangeDescMM),
              ),
              const VerticalSpacer(Dimens.MARGIN_MEDIUM_2),

              // English Radio
              LanguageRadioTile(
                localeCode: localeCode,
                value: Localization.ENGLISH,
                onClick: (value) {
                  ref
                      .read(localeCodeProvider.notifier)
                      .update(Localization.ENGLISH);
                },
              ),

              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),

              // Myanmar Radio
              LanguageRadioTile(
                localeCode: localeCode,
                value: Localization.MYANMAR,
                onClick: (value) {
                  ref
                      .read(localeCodeProvider.notifier)
                      .update(Localization.MYANMAR);
                },
              ),

              const VerticalSpacer(Dimens.MARGIN_LARGE),
              ButtonViewFullWidth(
                margin: const EdgeInsets.symmetric(
                    horizontal: Dimens.MARGIN_MEDIUM_2),
                btnText: localeCode == Localization.ENGLISH
                    ? txtSelectLangauge
                    : txtSelectLangaugeMM,
                onClick: () {
                  context.popBack();
                  context.setLocale(Locale(localeCode));
                  // onDimiss();
                },
              ),
              const VerticalSpacer(Dimens.MARGIN_LARGE),
            ],
          );
        });
      },
    );
  }
}

class LanguageRadioTile extends StatelessWidget {
  final String localeCode;
  final String value;
  final Function(String?) onClick;

  const LanguageRadioTile(
      {super.key,
      required this.localeCode,
      required this.value,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: localeCode,
      title: Text(
        value == Localization.ENGLISH ? txtEnglishLanguage : txtMyanmarLanguage,
        style: TextStyle(
            color: localeCode == value
                ? PRIMARY_COLOR
                : context.getColorScheme().onSurface),
      ),
      visualDensity: const VisualDensity(vertical: 3),
      controlAffinity: ListTileControlAffinity.trailing,
      onChanged: onClick,
      activeColor: PRIMARY_COLOR,
      selected: true,
    );
  }
}

class ProfileMenuItemWithToggle extends StatelessWidget {
  final String text;
  final String icon;
  final bool toggle;
  final Function(bool) onToggle;

  const ProfileMenuItemWithToggle(
      {super.key,
      required this.text,
      required this.icon,
      required this.toggle,
      required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.MARGIN_MEDIUM_2, vertical: Dimens.MARGIN_20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: Dimens.MARGIN_XLARGE,
              width: Dimens.MARGIN_XLARGE,
              child: SvgIcon(icon)),
          const HorizontalSpacer(Dimens.MARGIN_MEDIUM_2),
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: Dimens.TEXT_REGULAR_2),
          ),
          const Spacer(),
          Switch(value: toggle, onChanged: onToggle)
        ],
      ),
    );
  }
}

class ProfileMenuItemView extends StatelessWidget {
  final String text;
  final String icon;
  final Function() onClick;

  const ProfileMenuItemView(
      {super.key,
      required this.text,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.MARGIN_MEDIUM_2, vertical: Dimens.MARGIN_20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: Dimens.MARGIN_XLARGE,
                width: Dimens.MARGIN_XLARGE,
                child: SvgIcon(icon)),
            const HorizontalSpacer(Dimens.MARGIN_MEDIUM_2),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: Dimens.TEXT_REGULAR_2),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}

class ProfileInfoSectionView extends StatelessWidget {
  const ProfileInfoSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: Dimens.MARGIN_MEDIUM_2),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.MARGIN_MEDIUM_2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Image.asset(
              "profile_placeholder.jpg".toAssetImage(),
              fit: BoxFit.cover,
              width: 90,
              height: 90,
            ),
          ),
          const HorizontalSpacer(Dimens.MARGIN_MEDIUM_2),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitleText("User Profile"),
                VerticalSpacer(Dimens.MARGIN_10),
                Row(
                  children: [
                    Icon(
                      Icons.phone_rounded,
                      size: Dimens.MARGIN_MEDIUM_2,
                    ),
                    SizedBox(width: Dimens.MARGIN_MEDIUM),
                    Text(
                      "(704) 555-0127",
                      style: TextStyle(fontSize: Dimens.TEXT_SMALL),
                    ),
                  ],
                ),
                VerticalSpacer(Dimens.MARGIN_SMALL),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: Dimens.MARGIN_MEDIUM_2,
                    ),
                    SizedBox(width: Dimens.MARGIN_MEDIUM),
                    Text(
                      "angelina@example.com",
                      style: TextStyle(fontSize: Dimens.TEXT_SMALL),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Icon(Icons.edit_note_rounded)
        ],
      ),
    );
  }
}
