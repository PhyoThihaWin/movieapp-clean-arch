import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';

import '../../base/usecases/no_param_stream_usecase.dart';
import '../repository/home/movie_repository.dart';

class FetchPopularPersonUseCase extends NoParamStreamUseCase<List<ActorVo>> {
  final MovieRepository repo;

  FetchPopularPersonUseCase(this.repo);

  @override
  Stream<List<ActorVo>> execute() {
    return repo.getDbPopularPerson();
  }
}
