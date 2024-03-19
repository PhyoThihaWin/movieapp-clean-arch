import '../../base/usecases/no_param_usecase.dart';
import '../repository/home/home_repository.dart';

class FetchNowPlayingMoviesUseCase extends NoParamUseCase {
  final HomeRepository repo;

  FetchNowPlayingMoviesUseCase(this.repo);

  @override
  Future execute() {
    return Future(() => repo.getNowPlayingMovies());
  }
}
