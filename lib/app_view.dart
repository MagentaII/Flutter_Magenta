import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_magenta/screens/flutter_weather/blocs/search_record_bloc/search_record_bloc.dart';
import 'package:flutter_magenta/screens/flutter_weather/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter_magenta/screens/github_search/blocs/github_detail_bloc/github_detail_bloc.dart';
import 'package:flutter_magenta/screens/github_search/blocs/github_search_bloc/github_search_bloc.dart';
import 'package:flutter_magenta/screens/home/widgets/bottom_navigation_bar.dart';
import 'package:flutter_magenta/screens/music_player/bloc/music_player_bloc.dart';
import 'package:flutter_magenta/theme/theme.dart';
import 'package:flutter_magenta/theme/util.dart';

import 'package:github_repository/github_repository.dart';

import 'package:weather_repository/weather_repository.dart';

class MagentaAppView extends StatelessWidget {
  const MagentaAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "ABeeZee", "ABeeZee");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GithubSearchBloc(
              repository: RepositoryProvider.of<GithubRepository>(context)),
        ),
        BlocProvider(
            create: (context) => GithubDetailBloc(
                repository: RepositoryProvider.of<GithubRepository>(context))),
        BlocProvider(
            create: (context) => WeatherBloc(
                repository: RepositoryProvider.of<WeatherRepository>(context))),
        BlocProvider(
            create: (context) => SearchRecordBloc(
                repository: RepositoryProvider.of<WeatherRepository>(context))),
        BlocProvider(
            create: (context) => MusicPlayerBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Magenta',
        debugShowCheckedModeBanner: false,
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        home: const MyBottomNavigationBar(),
      ),
    );
  }
}
