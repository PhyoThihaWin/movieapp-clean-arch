import '../repository/home/home_repository.dart';

class FavoriteMovieUseCase {
  final HomeRepository _repo;

  FavoriteMovieUseCase(this._repo);

  execute(int params) {
    _repo.saveFavoriteMovie(params);
  }
}
