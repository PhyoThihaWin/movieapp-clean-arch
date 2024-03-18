import '../../base/usecases/no_param_usecase.dart';
import '../repository/home/home_repository.dart';

class FetchNowPlayingMoviesUseCase extends NoParamUseCase {
  final HomeRepository _repo;

  FetchNowPlayingMoviesUseCase(this._repo);

  @override
  Future execute() {
    return Future(() => _repo.getNowPlayingMovies());
  }
}
