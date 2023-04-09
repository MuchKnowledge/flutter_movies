import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_flutter/common/ui/constants/edge_symmetric_default.dart';
import 'package:movies_flutter/common/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'movie_details_bloc.dart';
import 'movie_details_state.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String imdbId;

  const MovieDetailsScreen({Key? key, required this.imdbId}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final movieDetailsBloc = GetIt.instance.get<MovieDetailsBloc>();
    movieDetailsBloc.loadMovieDetails(widget.imdbId);

    return BlocProvider<MovieDetailsBloc>(
        create: (_) => movieDetailsBloc,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: TextWidget(
                movieTitle:
                    AppLocalizations.of(context).movie_detail_app_bar_title,
              ),
            ),
            body: BlocBuilder<MovieDetailsBloc, MovieState>(
                builder: (context, state) {
              if (state is MovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MovieLoaded) {
                final movie = state.movie;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 5,
                              blurRadius: 15,
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(movie.posterUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: edgeInsetsSymmetricDefault,
                        child: Center(
                          child: TextWidget(
                            movieTitle: movie.title,
                          ),
                        ),
                      ),
                      Padding(
                        padding: edgeInsetsSymmetricDefault,
                        child: TextWidget(
                          movieTitle:
                              '${AppLocalizations.of(context).plot} ${movie.plot}',
                        ),
                      ),
                      Padding(
                        padding: edgeInsetsSymmetricDefault,
                        child: TextWidget(
                          movieTitle:
                              '${AppLocalizations.of(context).actors} ${movie.actors}',
                        ),
                      ),
                      Padding(
                        padding: edgeInsetsSymmetricDefault,
                        child: TextWidget(
                          movieTitle:
                              '${AppLocalizations.of(context).director} ${movie.director}',
                        ),
                      ),
                      Padding(
                        padding: edgeInsetsSymmetricDefault,
                        child: TextWidget(
                          movieTitle:
                              '${AppLocalizations.of(context).year} ${movie.year}',
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is MovieError) {
                return Center(child: TextWidget(movieTitle: state.message));
              } else {
                return Container();
              }
            })));
  }
}
