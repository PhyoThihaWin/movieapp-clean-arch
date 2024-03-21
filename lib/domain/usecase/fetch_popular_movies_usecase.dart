import 'package:movieapp_clean_arch/base/usecases/no_param_usecase.dart';

import '../repository/home/home_repository.dart';

class FetchPopularMoviesUseCase extends NoParamUseCase {
  final HomeRepository repo;

  FetchPopularMoviesUseCase(this.repo);

  @override
  Future execute() {
    return repo.getDbPopularMovies().first;
  }
}
