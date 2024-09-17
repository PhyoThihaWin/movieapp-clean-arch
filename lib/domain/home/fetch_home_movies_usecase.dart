import '../repository/home/movie_repository.dart';

class FetchHomeMoviesUsecase {
  final MovieRepository repository;

  FetchHomeMoviesUsecase(this.repository);

  Future call() async {
    await repository.getNowPlayingMovies();
    await repository.getUpComingMovies();
    await repository.getPopularMovies();
  }
}
