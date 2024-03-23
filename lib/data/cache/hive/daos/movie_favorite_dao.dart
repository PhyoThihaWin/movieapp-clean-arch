abstract class MovieFavoriteDao {
  favoriteMovie(int id);

  Future<bool> isFavoriteMovie(int id);
}
