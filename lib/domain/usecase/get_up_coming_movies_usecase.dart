import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';

import '../repository/home/movie_repository.dart';

class GetUpComingMoviesUseCase {
  final MovieRepository repo;

  GetUpComingMoviesUseCase(this.repo);

  Stream<List<MovieVo>> call() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield* repo.getDbUpComingMovies();
  }
}
