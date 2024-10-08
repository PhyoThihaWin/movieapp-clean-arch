import 'package:movieapp_clean_arch/base/usecases/no_param_stream_usecase.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';

import '../repository/home/movie_repository.dart';

class GetPopularMoviesUseCase extends NoParamStreamUseCase<List<MovieVo>> {
  final MovieRepository repo;

  GetPopularMoviesUseCase(this.repo);

  @override
  Stream<List<MovieVo>> execute() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield* repo.getDbNowPlayingMovies();
  }
}
