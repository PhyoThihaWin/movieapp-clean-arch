import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';

class MovieDetailVo {
  final int id;
  final bool adult;
  final String title;
  final String backdropPath;
  final String posterPath;
  final int runtime;
  final String releaseDate;
  final double voteAverage;
  final List<Genre> genres;
  final String originalLanguage;
  final String overview;
  final List<ActorVo> casts;
  final List<ActorVo> crews;
  final bool isFavorite;

  MovieDetailVo({
    required this.id,
    required this.adult,
    required this.title,
    required this.backdropPath,
    required this.posterPath,
    required this.runtime,
    required this.releaseDate,
    required this.voteAverage,
    required this.genres,
    required this.originalLanguage,
    required this.overview,
    required this.casts,
    required this.crews,
    this.isFavorite = false,
  });

  factory MovieDetailVo.fake() {
    return MovieDetailVo(
      adult: true,
      backdropPath: "/pEL9MKMmGRoUu788JcqPGEfzUOE.jpg",
      genres: [],
      id: 63842,
      originalLanguage: "en",
      overview:
          "With its unique camera work, \"Jack's POV 14\" brings you into the action and doesn't loosen its grip until you're completely drained. \"Jack's POV 14\", starring Digital Playground's beautiful contract girl Riley Steele gives you the best action, the most delicious teases, and pure in-your-face comedy. It's your job to cast sexy, young women like Riley Steele in music videos, resulting in you nailing gorgeous ass after even more succulent pussy. Let Jack's camera tease and tempt you, offering the finest bush on the planet, all in first hand perspective. \"Jack's POV 14\" stars 5 ready and willing hot girls: Riley Steele, Alexis Texas, Codi Carmichael, Kristina Rose, and Nicole Ray. Become Jack for a day and look into Riley's bright, blue eyes as she sucks your giant cock dry!",
      posterPath: "/aNBmUJqwNT1zgIoFTvZYwMlwNEx.jpg",
      releaseDate: "2009-07-28",
      runtime: 139,
      title: "Jack's POV 14",
      voteAverage: 7.8,
      casts: [],
      crews: [],
      isFavorite: false,
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });
}
