import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';

import '../../base/usecases/no_param_stream_usecase.dart';
import '../repository/home/movie_repository.dart';

class FetchUpComingMoviesUseCase extends NoParamStreamUseCase<List<MovieVo>> {
  final MovieRepository repo;

  FetchUpComingMoviesUseCase(this.repo);

  @override
  Stream<List<MovieVo>> execute() {
    return repo.getDbUpComingMovies();
  }
}
