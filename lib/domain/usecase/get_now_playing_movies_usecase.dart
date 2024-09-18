import 'package:movieapp_clean_arch/base/usecases/no_param_stream_usecase.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';

import '../repository/home/movie_repository.dart';

class GetNowPlayingMoviesUseCase extends NoParamStreamUseCase<List<MovieVo>> {
  final MovieRepository repo;

  GetNowPlayingMoviesUseCase(this.repo);

  @override
  Stream<List<MovieVo>> execute() {
    return repo.getDbNowPlayingMovies();
  }
}
