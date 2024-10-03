import 'package:get/get.dart';
import 'package:movieapp_clean_arch/page/profile/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}
