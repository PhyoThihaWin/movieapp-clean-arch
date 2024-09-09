import 'package:get/get.dart';
import 'package:movieapp_clean_arch/data/cache/cache_binding.dart';
import 'package:movieapp_clean_arch/data/network/network_binding.dart';
import 'package:movieapp_clean_arch/page/home/home_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    /// network layer binding
    NetworkBinding().dependencies();

    /// Cache layer binding
    CacheBinding().dependencies();

    /// page binding
    HomeBinding().dependencies();
  }
}
