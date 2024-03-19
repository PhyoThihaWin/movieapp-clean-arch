import 'package:movieapp_clean_arch/base/usecases/no_param_usecase.dart';

import '../repository/home/home_repository.dart';

class FetchUpComingMoviesUseCase extends NoParamUseCase {
  final HomeRepository repo;

  FetchUpComingMoviesUseCase(this.repo);

  @override
  Future execute() {
    return repo.getUpComingMovies();
  }
}
