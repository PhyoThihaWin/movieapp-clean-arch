import 'package:movieapp_clean_arch/base/usecases/no_param_stream_usecase.dart';
import 'package:movieapp_clean_arch/base/usecases/no_param_usecase.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';

import '../repository/home/home_repository.dart';

class FetchPopularMoviesUseCase extends NoParamStreamUseCase<List<MovieVo>> {
  final HomeRepository repo;

  FetchPopularMoviesUseCase(this.repo);

  @override
  Stream<List<MovieVo>> execute() {
    return repo.getDbPopularMovies();
  }


}
