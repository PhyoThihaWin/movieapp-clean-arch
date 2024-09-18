import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';

import '../repository/home/movie_repository.dart';

class GetNowplayingPagingUsecase {
  final MovieRepository repository;

  GetNowplayingPagingUsecase(this.repository);

  Future<List<MovieVo>> call(int page) =>
      repository.getNowPlayingMoviesPaging(page: page);
}
