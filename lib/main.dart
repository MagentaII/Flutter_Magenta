import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_magenta/app.dart';
import 'package:flutter_magenta/core/simple_bloc_observer.dart';
import 'package:flutter_magenta/screens/music_player/repository/music_player_repository.dart';
import 'package:github_repository/github_repository.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_repository/weather_repository.dart';
import 'injection/service_locator.dart';

void main() async {
  // dependency injection (DI)
  setup();

  Bloc.observer = const SimpleBlocObserver();

  // Initialize

  await Hive.initFlutter();
  // Open a box
  await Hive.openBox<String>('myAvatarBox');

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(create: (_) => GithubRepository(cache: GithubCache())),
      RepositoryProvider(create: (_) => WeatherRepository()),
      RepositoryProvider(create: (_) => MusicPlayerRepository()),
    ],
    child: const MagentaApp(),
  ));
}
