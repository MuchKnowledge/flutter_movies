import 'models/movie_item.dart';
import 'models/movie_list_item.dart';

abstract class MovieRepository {
  Future<List<MovieListItem>> searchMovies(String query);
  Future<MovieItem> loadMovieDetails(String imdbId);
}