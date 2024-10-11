import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';
import '../repository/home/movie_repository.dart';

class FetchPopularPersonUseCase {
  final MovieRepository repo;

  FetchPopularPersonUseCase(this.repo);

  Stream<List<ActorVo>> call() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield* repo.getDbPopularPerson();
  }
}
