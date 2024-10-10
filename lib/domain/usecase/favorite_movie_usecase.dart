import '../repository/home/movie_repository.dart';

class FavoriteMovieUseCase {
  final MovieRepository _repo;

  FavoriteMovieUseCase(this._repo);

  call(int params) {
    _repo.saveFavoriteMovie(params);
  }
}
