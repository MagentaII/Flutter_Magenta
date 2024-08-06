import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_magenta/screens/flutter_weather/blocs/weather_bloc.dart';
import 'package:flutter_magenta/screens/github_search/blocs/github_detail_bloc/github_detail_bloc.dart';
import 'package:flutter_magenta/screens/github_search/blocs/github_search_bloc/github_search_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_repository/weather_repository.dart';

import 'screens/home/views/home_view.dart';

class MagentaAppView extends StatelessWidget {
  const MagentaAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GithubSearchBloc(repository: RepositoryProvider.of<GithubRepository>(context))),
        BlocProvider(create: (context) => GithubDetailBloc(repository: RepositoryProvider.of<GithubRepository>(context))),
        BlocProvider(create: (context) => WeatherBloc(repository: RepositoryProvider.of<WeatherRepository>(context))),
      ],
      child: MaterialApp(
        title: 'Flutter Magenta',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
          ),
          textTheme: GoogleFonts.robotoSlabTextTheme(),
        ),
        home: const HomeView(),
      ),
    );
  }
}
