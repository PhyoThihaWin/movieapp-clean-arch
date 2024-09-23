import '../models/movie_vo.dart';
import '../repository/home/movie_repository.dart';

class GetUpcomingPagingUsecase {
  final MovieRepository repository;

  GetUpcomingPagingUsecase(this.repository);

  Future<List<MovieVo>> call(int page) =>
      repository.getUpComingMoviesPaging(page: page);
}
