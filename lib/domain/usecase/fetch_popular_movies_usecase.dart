import 'package:movieapp_clean_arch/base/usecases/no_param_usecase.dart';

import '../repository/home/home_repository.dart';

class FetchPopularMovies extends NoParamUseCase {
  final HomeRepository repo;

  FetchPopularMovies(this.repo);

  @override
  Future execute() {
    return repo.getPopularMovies();
  }
}
