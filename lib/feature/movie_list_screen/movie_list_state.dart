import '../../common/data/models/movie_list_ui.dart';

abstract class MovieListState {}

class MovieListInitial extends MovieListState {}

class MovieListLoading extends MovieListState {}

class MovieListLoaded extends MovieListState {
  final List<MovieListUi> movies;

  MovieListLoaded(this.movies);
}

class MovieListError extends MovieListState {
  final String message;

  MovieListError(this.message);
}
