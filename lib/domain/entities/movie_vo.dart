class MovieVo {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final List<int> genreIds;

  const MovieVo(
    this.id,
    this.title,
    this.overview,
    this.backdropPath,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.genreIds,
  );
}
