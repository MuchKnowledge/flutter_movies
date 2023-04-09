import '../../network/models/movie_row.dart';
import '../models/movie_item.dart';

extension MovieExtensions on MovieRow {
  MovieItem toItem() {
    return MovieItem(
      id: id,
      title: title ?? "",
      year: year ?? "",
      director: director ?? "",
      posterUrl: posterUrl ?? "",
      actors: actors ?? "",
      plot: plot ?? "",
    );
  }
}
