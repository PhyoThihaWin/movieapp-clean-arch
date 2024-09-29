import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/movie_repository.dart';

class SearchMoviesUsecase {
  final MovieRepository _movieRepository;

  SearchMoviesUsecase(this._movieRepository);

  Future<List<MovieVo>> call({String? query, required int page}) =>
      _movieRepository.searchMoviesPaging(query: query, page: page);
}
