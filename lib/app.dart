import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';
import 'app_view.dart';

class MagentaApp extends StatelessWidget {
  final GithubRepository _githubRepository;

  const MagentaApp({
  required GithubRepository githubRepository,
  super.key,
  }) : _githubRepository = githubRepository;

  @override
  Widget build(BuildContext context) {
    return const MagentaAppView();
  }
}
