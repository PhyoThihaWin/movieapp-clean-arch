import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'apiclient/dio_client.dart';
import 'home/home_service.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    /// dio
    Get.lazyPut(() => DioClient.getDio());

    /// home service
    Get.lazyPut(() => HomeService(Get.find<Dio>()));
  }
}
