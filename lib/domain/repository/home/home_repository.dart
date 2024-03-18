import 'package:movieapp_clean_arch/domain/entities/MovieVo.dart';

abstract class HomeRepository {
  Future<List<MovieVo>> getNowPlayingMovies();
}
