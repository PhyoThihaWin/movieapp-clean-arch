import 'package:movieapp_clean_arch/base/usecases/no_param_usecase.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';

class FetchHeadlineUseCase extends NoParamUseCase {
  final HomeRepository _repo;

  FetchHeadlineUseCase(this._repo);

  @override
  Future execute() {
    return _repo.getPosts();
  }

}
