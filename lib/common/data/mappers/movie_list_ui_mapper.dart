import '../models/movie_list_item.dart';
import '../models/movie_list_ui.dart';

extension MovieListExtensions on MovieListItem {
  MovieListUi toListUi() {
    return MovieListUi(
      id: id,
      title: title,
      year: year,
      posterUrl: posterUrl,
    );
  }
}
