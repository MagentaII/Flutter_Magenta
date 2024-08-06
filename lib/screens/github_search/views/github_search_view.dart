import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/github_search_bloc/github_search_bloc.dart';
import '../widgets/search_results.dart';

class GithubSearchView extends StatelessWidget {
  const GithubSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Search')),
      body: Column(
        children: <Widget>[
          _GithubSearchBar(),
          Expanded(child: _GithubSearchBody()),
        ],
      ),
    );
  }
}

class _GithubSearchBar extends StatefulWidget {
  @override
  State<_GithubSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_GithubSearchBar> {
  final _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Search Repository',
              ),
            ),
          ),
        ),
        IconButton(
          key: const Key('searchPage_search_iconButton'),
          icon: const Icon(Icons.search, semanticLabel: 'Submit'),
          onPressed: () =>
              context.read<GithubSearchBloc>().add(TextChanged(text: _text)),
        )
      ],
    );
  }
}

class _GithubSearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
      builder: (context, state) {
        return Center(
          child: switch (state) {
            SearchStateEmpty() => const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('🤔', style: TextStyle(fontSize: 48)),
                SizedBox(height: 8),
                Text('Please enter a term to begin', style: TextStyle(fontSize: 24)),
              ],
            ),
            SearchStateLoading() => const CircularProgressIndicator.adaptive(),
            SearchStateError() => Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('🥲', style: TextStyle(fontSize: 48)), // Emoji text
                const SizedBox(height: 8), // Space between emoji and error text
                Text(state.error, style: const TextStyle(fontSize: 24)), // Error message
              ],
            ),
            SearchStateSuccess() => state.items.isEmpty
                ? const Text('No Results')
                : Expanded(child: SearchResults(items: state.items)),
          },
        );
      },
    );
  }
}
