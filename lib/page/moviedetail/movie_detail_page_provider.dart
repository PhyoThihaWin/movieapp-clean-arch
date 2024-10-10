import 'package:movieapp_clean_arch/data/repository_provider.dart';
import 'package:movieapp_clean_arch/domain/models/movie_detail_vo.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_movie_detail_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_detail_page_provider.g.dart';

@riverpod
GetMovieDetailUsecase getMovieDetailUsecase(GetMovieDetailUsecaseRef ref) {
  return GetMovieDetailUsecase(ref.read(movieRepositoryProvider));
}

@riverpod
class GetMovieDetails extends _$GetMovieDetails {
  @override
  Future<MovieDetailVo> build(int movieId) async {
    return ref.watch(getMovieDetailUsecaseProvider)(movieId);
  }
}
