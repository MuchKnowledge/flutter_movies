import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../../feature/movie_list_screen/movie_list_bloc.dart';
import '../../feature/movie_list_screen/movie_list_screen.dart';
import '../data/movie_repository.dart';
import '../di/service_locator.dart';

void main() {
  setupLocator();

  final movieRepository = locator<MovieRepository>();
  final movieListBloc = MovieListBloc(repository: movieRepository);

  runApp(
    MultiProvider(
      providers: [
        Provider<MovieListBloc>.value(value: movieListBloc),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ru', ''),
      ],
      title: 'Flutter Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieListScreen(),
    );
  }
}
