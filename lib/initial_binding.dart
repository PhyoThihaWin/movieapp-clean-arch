import 'package:get/get.dart';
import 'package:movieapp_clean_arch/data/cache/cache_binding.dart';
import 'package:movieapp_clean_arch/data/network/network_binding.dart';
import 'package:movieapp_clean_arch/data/repository_binding.dart';
import 'package:movieapp_clean_arch/main.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    /// network layer binding
    NetworkBinding().dependencies();

    /// Cache layer binding
    CacheBinding().dependencies();

    /// Repository binding
    RepositoryBinding().dependencies();

    /// ThemeDataController
    Get.lazyPut<ThemeDataController>(() => ThemeDataController());
  }
}
