import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_magenta/app.dart';
import 'package:flutter_magenta/simple_bloc_observer.dart';
import 'package:github_repository/github_repository.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(
    MagentaApp(
      githubRepository: GithubRepository(cache: GithubCache()),
    ),
  );
}
