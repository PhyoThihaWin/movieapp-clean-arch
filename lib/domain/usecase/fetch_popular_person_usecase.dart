import 'package:movieapp_clean_arch/base/usecases/no_param_usecase.dart';

import '../repository/home/home_repository.dart';

class FetchPopularPersonUseCase extends NoParamUseCase {
  final HomeRepository repo;

  FetchPopularPersonUseCase(this.repo);

  @override
  Future execute() {
    return repo.getPopularPerson();
  }
}
