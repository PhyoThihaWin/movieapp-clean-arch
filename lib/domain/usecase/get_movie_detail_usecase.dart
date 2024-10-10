import 'package:movieapp_clean_arch/domain/models/movie_detail_vo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/movie_repository.dart';

class GetMovieDetailUsecase {
  final MovieRepository _repository;

  GetMovieDetailUsecase(this._repository);

  Future<MovieDetailVo> call(int movieId) =>
      _repository.getMovieDetails(movieId);
}
