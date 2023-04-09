import 'package:dio/dio.dart';

import '../models/movie_list_row.dart';
import '../models/movie_row.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<MovieListRow>> searchMovies(String query) async {
    final response =
        await _dio.get('$baseUrl$apiKey&type=movie&s=$query&page=1');
    print('response = $response');

    if (response.data['Response'] == 'False') {
      throw Exception(response.data['Error']);
    }

    final results = response.data['Search'];
    if (results == null) {
      return [];
    }
    final movieListRows = results
        .map<MovieListRow>((json) => MovieListRow(
              id: json['imdbID'],
              title: json['Title'],
              posterUrl: json['Poster'],
              year: json["Year"],
            ))
        .toList();
    return movieListRows;
  }

  Future<MovieRow> getMovieDetails(String imdbId) async {
    final response = await _dio.get('$baseUrl$apiKey&i=$imdbId');
    final json = response.data;
    return MovieRow(
      id: json['imdbID'],
      title: json['Title'],
      year: json['Year'],
      director: json['Director'],
      posterUrl: json['Poster'],
      plot: json["Plot"],
      actors: json["Actors"],
    );
  }

  static const baseUrl = "https://www.omdbapi.com/.?apikey=";
  static const apiKey = "2b3f3c3f";
}
