class MovieVo {
  final String key;
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final List<int> genreIds;

  bool isFavorite;

  MovieVo(
      this.key,
      this.id,
      this.title,
      this.overview,
      this.backdropPath,
      this.posterPath,
      this.releaseDate,
      this.voteAverage,
      this.genreIds,
      this.isFavorite);
}
