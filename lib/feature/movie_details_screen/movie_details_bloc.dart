import 'package:bloc/bloc.dart';
import 'package:movies_flutter/common/data/mappers/movie_ui_mapper.dart';

import '../../common/data/movie_repository.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Cubit<MovieState> {
  final MovieRepository _repository;

  MovieDetailsBloc({required MovieRepository repository})
      : _repository = repository,
        super(MovieInitial());

  Future<void> loadMovieDetails(String imdbId) async {
    emit(MovieLoading());
    try {
      final result = await _repository.loadMovieDetails(imdbId);
      emit(MovieLoaded(result.toUi()));
    } on Exception catch (e) {
      emit(MovieError('$e'));
    }
  }
}
