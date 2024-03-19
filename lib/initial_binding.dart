import 'package:get/get.dart';
import 'package:movieapp_clean_arch/data/network/dio_client.dart';
import 'package:movieapp_clean_arch/page/home/home_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    /// dio
    Get.lazyPut(() => DioClient.getDio());
    /// home binding
    HomeBinding().dependencies();
  }
}
