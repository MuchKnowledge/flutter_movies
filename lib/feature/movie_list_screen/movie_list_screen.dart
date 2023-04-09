import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import '../../common/ui/widgets/movie_item_widget.dart';
import '../movie_details_screen/movie_details_screen.dart';
import 'movie_list_bloc.dart';
import 'movie_list_state.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final _searchController = TextEditingController();
  late MovieListBloc _movieListBloc;

  @override
  void initState() {
    super.initState();
    _movieListBloc = GetIt.instance.get<MovieListBloc>();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _movieListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieListBloc>(
      create: (_) => _movieListBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).movie_list_app_bar_title),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _movieListBloc.searchMovies(value);
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<MovieListBloc, MovieListState>(
                builder: (context, state) {
                  if (state is MovieListInitial) {
                    return Center(
                        child: Text(AppLocalizations.of(context).empty_state));
                  }
                  if (state is MovieListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is MovieListLoaded) {
                    return ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return MovieListItemWidget(
                          key: UniqueKey(),
                          movie: movie,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailsScreen(
                                  imdbId: movie.id,
                                  key: UniqueKey(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (state is MovieListError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
