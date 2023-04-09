import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_flutter/common/data/mappers/movie_list_ui_mapper.dart';

import '../../common/data/movie_repository.dart';
import 'movie_list_state.dart';

class MovieListBloc extends Cubit<MovieListState> {
  final MovieRepository _repository;

  MovieListBloc({required MovieRepository repository})
      : _repository = repository,
        super(MovieListInitial());

  Future<void> searchMovies(String query) async {
    emit(MovieListLoading());
    try {
      final movies = await _repository.searchMovies(query);
      emit(MovieListLoaded(movies.map((item) => item.toListUi()).toList()));
    } on Exception catch (e) {
      final errorMessage =
          e.toString().isEmpty ? "Failed to load movies" : e.toString();
      emit(MovieListError(errorMessage));
    }
  }
}
