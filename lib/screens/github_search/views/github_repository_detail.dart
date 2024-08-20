import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../blocs/github_detail_bloc/github_detail_bloc.dart';

class GithubRepositoryDetail extends StatelessWidget {
  final String fullName;

  const GithubRepositoryDetail({super.key, required this.fullName});

  static Route<void> route(String fullName) {
    return MaterialPageRoute(
      builder: (context) => GithubRepositoryDetail(fullName: fullName),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<GithubDetailBloc>().add(OnRepoTapped(fullName: fullName));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Repository Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<GithubDetailBloc, GithubDetailState>(
        builder: (context, state) {
          return switch (state) {
            DetailStateEmpty() => const Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('🤔', style: TextStyle(fontSize: 48)),
                    SizedBox(height: 8),
                    Text('Please enter a term to begin',
                        style: TextStyle(fontSize: 24)),
                  ],
                ),
            ),
            DetailStateLoading() =>
              const Center(child: CircularProgressIndicator.adaptive()),
            DetailStateError() => Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('🥲', style: TextStyle(fontSize: 48)),
                    // Emoji text
                    const SizedBox(height: 8),
                    // Space between emoji and error text
                    Text(state.error, style: const TextStyle(fontSize: 24)),
                    // Error message
                  ],
                ),
            ),
            DetailStateSuccess() => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Repository Avatar
                    Center(
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(state.detail.avatarUrl),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Repository Title
                    Center(
                      child: Text(
                        state.detail.fullName,
                        style: const TextStyle(
                          fontSize: 32.0, // headline5 的字體大小
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Repository Description
                    Text(
                      state.detail.description ?? '',
                      style: const TextStyle(
                        fontSize: 20.0, // bodyText1 的字體大小
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Stats Row
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber),
                                const SizedBox(width: 4.0),
                                Text(state.detail.stargazersCount.toString(),
                                    style: const TextStyle(fontSize: 20.0)),
                                // bodyText2 的字體大小
                              ],
                            ),
                            const VerticalDivider(),
                            Row(
                              children: [
                                const Icon(Icons.fork_right,
                                    color: Colors.grey),
                                const SizedBox(width: 4.0),
                                Text(state.detail.forksCount.toString(),
                                    style: const TextStyle(fontSize: 20.0)),
                                // bodyText2 的字體大小
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Language & Last Updated
                    Text(
                      'Language: ${state.detail.language}',
                      style: const TextStyle(
                        fontSize: 20.0, // bodyText2 的字體大小
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Last updated: ${state.detail.updatedAt}',
                      style: const TextStyle(
                        fontSize: 20.0, // bodyText2 的字體大小
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    // Open Repository Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () =>
                            launchUrl(Uri.parse(state.detail.htmlUrl)),
                        child: const Text(
                          'Open Repository',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
