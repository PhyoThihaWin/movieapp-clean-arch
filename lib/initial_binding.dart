import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:movieapp_clean_arch/page/home/home_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
  }
}
