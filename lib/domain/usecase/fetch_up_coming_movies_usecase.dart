import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';

import '../../base/usecases/no_param_stream_usecase.dart';
import '../repository/home/home_repository.dart';

class FetchUpComingMoviesUseCase extends NoParamStreamUseCase<List<MovieVo>> {
  final HomeRepository repo;

  FetchUpComingMoviesUseCase(this.repo);

  @override
  Stream<List<MovieVo>> execute() {
    return repo.getDbUpComingMovies();
  }
}
