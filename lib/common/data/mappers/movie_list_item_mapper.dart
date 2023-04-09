import '../../network/models/movie_list_row.dart';
import '../models/movie_list_item.dart';

extension MovieListExtensions on MovieListRow {
  MovieListItem toListItem() {
    return MovieListItem(
      id: id,
      title: title ?? "",
      year: year ?? "",
      posterUrl: posterUrl ?? "",
    );
  }
}
