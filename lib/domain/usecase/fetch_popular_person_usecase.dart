import 'package:movieapp_clean_arch/base/usecases/no_param_usecase.dart';
import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';

import '../../base/usecases/no_param_stream_usecase.dart';
import '../repository/home/home_repository.dart';

class FetchPopularPersonUseCase extends NoParamStreamUseCase<List<ActorVo>> {
  final HomeRepository repo;

  FetchPopularPersonUseCase(this.repo);

  @override
  Stream<List<ActorVo>> execute() {
    return repo.getDbPopularPerson();
  }
}
