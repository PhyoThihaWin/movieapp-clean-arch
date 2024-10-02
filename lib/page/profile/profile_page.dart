import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/page/home/home_page.dart';
import 'package:movieapp_clean_arch/utils/primitive_ext.dart';
import 'package:movieapp_clean_arch/widget/space_widget.dart';
import 'package:movieapp_clean_arch/widget/svg_image.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../resource/dimens.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // final ProfilePageController _profilePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const ProfileInfoSectionView(),
          const VerticalSpacer(Dimens.MARGIN_XXXLARGE),
          ProfileMenuItemView(
            text: "My ticket",
            icon: "ic_ticket_setting.svg",
            onClick: () {},
          ),
          Divider(
            color: Colors.grey.withOpacity(0.3),
          ),
          ProfileMenuItemView(
            text: "Payment history",
            icon: "ic_cart_setting.svg",
            onClick: () {},
          ),
          Divider(
            color: Colors.grey.withOpacity(0.3),
          ),
          ProfileMenuItemView(
            text: "Change language",
            icon: "ic_translate_setting.svg",
            onClick: () {},
          ),
          Divider(
            color: Colors.grey.withOpacity(0.3),
          ),
          ProfileMenuItemView(
            text: "Change password",
            icon: "ic_lock_setting.svg",
            onClick: () {},
          ),
          Divider(
            color: Colors.grey.withOpacity(0.3),
          ),
          ProfileMenuItemWithToggle(
            text: "Dark Mode",
            icon: "ic_biometric_setting.svg",
            toggle: Provider.of<ThemeProvider>(context).currentTheme ==
                ThemeMode.dark,
            onToggle: (value) {
              context.read<ThemeProvider>().changeCurrentTheme();
            },
          ),
        ],
      ),
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
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.MARGIN_MEDIUM_2, vertical: Dimens.MARGIN_20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgIcon(icon),
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
      ),
    );
  }
}

class ProfileMenuItemView extends StatelessWidget {
  final String text;
  final String icon;
  final Function onClick;

  const ProfileMenuItemView(
      {super.key,
      required this.text,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.MARGIN_MEDIUM_2, vertical: Dimens.MARGIN_20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgIcon(icon),
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
