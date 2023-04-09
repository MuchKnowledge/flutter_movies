import 'package:movies_flutter/common/data/mappers/movie_item_mapper.dart';
import 'package:movies_flutter/common/data/mappers/movie_list_item_mapper.dart';
import 'package:movies_flutter/common/data/models/movie_item.dart';

import '../network/api/api_service.dart';
import 'models/movie_list_item.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiService _apiService;

  MovieRepositoryImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<List<MovieListItem>> searchMovies(String query) async {
    final movieListRow = await _apiService.searchMovies(query);
    final movieListItems =
        movieListRow.map((movieRow) => movieRow.toListItem()).toList();
    return Future.value(movieListItems);
  }

  @override
  Future<MovieItem> loadMovieDetails(String imdbId) async {
    final movieRow = await _apiService.getMovieDetails(imdbId);
    return Future.value(movieRow.toItem());
  }
}
