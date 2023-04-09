import '../../common/data/models/movie_ui.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}

class MovieLoaded extends MovieState {
  final MovieUi movie;

  MovieLoaded(this.movie);
}
