import 'package:dio/dio.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';

import '../network/home/home_service.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeService homeService;

  HomeRepositoryImpl(this.homeService);

  @override
  Future<String> getPosts() {
    return homeService.getPosts();
  }
}
