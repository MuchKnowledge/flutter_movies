import 'package:get_it/get_it.dart';
import 'package:movies_flutter/feature/movie_details_screen/movie_details_bloc.dart';

import '../../feature/movie_list_screen/movie_list_bloc.dart';
import '../data/movie_repository.dart';
import '../data/movie_repository_impl.dart';
import '../network/api/api_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(apiService: locator<ApiService>()));
  locator.registerFactory(
      () => MovieListBloc(repository: locator<MovieRepository>()));
  locator.registerFactory(
      () => MovieDetailsBloc(repository: locator<MovieRepository>()));
}
