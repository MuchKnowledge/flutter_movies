import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_flutter/common/ui/widgets/text_widget.dart';

import '../../data/models/movie_list_ui.dart';

class MovieListItemWidget extends StatelessWidget {
  final MovieListUi movie;
  final VoidCallback onTap;

  const MovieListItemWidget(
      {Key? key, required this.movie, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  movie.posterUrl,
                  width: 70.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      movieTitle: movie.title,
                    ),
                    const SizedBox(height: 4.0),
                    TextWidget(
                      movieTitle:
                          '${AppLocalizations.of(context).year} ${movie.year}',
                    ),
                    const SizedBox(height: 4.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
