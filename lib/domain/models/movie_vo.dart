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

  static List<MovieVo> fakeMovieList = [
    MovieVo(
      'movie1',
      101,
      'The Lost Kingdom',
      'An ancient kingdom is discovered with mystical powers that could save or destroy the world.',
      '/backdrop1.jpg',
      '/poster1.jpg',
      '2023-05-12',
      8.7,
      [28, 12, 14],
      false,
    ),
    MovieVo(
      'movie2',
      102,
      'The Final Frontier',
      'A space crew ventures to the edge of the universe only to encounter unimaginable horrors.',
      '/backdrop2.jpg',
      '/poster2.jpg',
      '2023-09-10',
      7.9,
      [878, 12, 53],
      true,
    ),
    MovieVo(
      'movie3',
      103,
      'Shadows of the Night',
      'A detective must uncover the truth behind a series of mysterious disappearances in the city.',
      '/backdrop3.jpg',
      '/poster3.jpg',
      '2023-07-22',
      6.5,
      [80, 9648, 53],
      false,
    ),
    MovieVo(
      'movie4',
      104,
      'Rising Phoenix',
      'A young warrior rises to defeat an evil tyrant and bring peace to her kingdom.',
      '/backdrop4.jpg',
      '/poster4.jpg',
      '2023-11-01',
      9.2,
      [28, 14, 18],
      true,
    ),
    MovieVo(
      'movie5',
      105,
      'Echoes in the Wind',
      'Two strangers find themselves drawn together by an otherworldly force that defies explanation.',
      '/backdrop5.jpg',
      '/poster5.jpg',
      '2024-01-19',
      7.4,
      [18, 10749, 14],
      false,
    ),
  ];
}
