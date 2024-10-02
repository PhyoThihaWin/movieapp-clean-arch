import 'package:get/get.dart';
import 'package:movieapp_clean_arch/data/cache/datasource/app_config_datasource.dart';
import 'package:movieapp_clean_arch/data/repository/app_config_repository_impl.dart';
import 'package:movieapp_clean_arch/domain/repository/other/app_config_repository.dart';
import 'package:movieapp_clean_arch/page/profile/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppConfigDatasource>(() => AppConfigDatasource());
    Get.lazyPut<AppConfigRepository>(() => AppConfigRepositoryImpl(Get.find()));
    Get.lazyPut<ProfilePageController>(() => ProfilePageController(Get.find()));
  }
}
