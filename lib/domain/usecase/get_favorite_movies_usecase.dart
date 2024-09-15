import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';

import '../repository/home/movie_repository.dart';

class GetFavoriteMoviesUsecase {
  final MovieRepository _repo;

  GetFavoriteMoviesUsecase(this._repo);

  Stream<List<MovieVo>> call() => _repo.getDbFavoriteMOvies();
}
