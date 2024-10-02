import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/domain/repository/other/app_config_repository.dart';

class ProfilePageController extends GetxController {
  final AppConfigRepository _appConfigRepository;

  var isDarkModeOn = true.obs;

  ProfilePageController(this._appConfigRepository);

  @override
  void onInit() {
    super.onInit();
    _appConfigRepository.getThemeMode().then((onValue) {
      isDarkModeOn.value = onValue == ThemeMode.dark;
    });
  }
}
