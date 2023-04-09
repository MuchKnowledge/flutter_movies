import '../models/movie_item.dart';
import '../models/movie_ui.dart';

extension MovieExtensions on MovieItem {
  MovieUi toUi() {
    return MovieUi(
      id: id,
      title: title,
      year: year,
      director: director,
      posterUrl: posterUrl,
      actors: actors,
      plot: plot,
    );
  }
}
