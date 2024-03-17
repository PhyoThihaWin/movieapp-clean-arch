import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  var post = Rx<String?>(null);

  var position = 0.obs;

  getPosts() async {
    var data = await _homeRepository.getPosts();
    debugPrint("Data: $data");
    post.value = data;
  }

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

}
