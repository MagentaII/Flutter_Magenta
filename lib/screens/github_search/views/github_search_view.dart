import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/github_search_bloc/github_search_bloc.dart';
import '../widgets/search_results.dart';

class GithubSearchView extends StatelessWidget {
  const GithubSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GitHub Search',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.home,
                size: 32,
              )),
        ),
      ),
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
  final FocusNode _focusNode = FocusNode();
  bool _isEditing = false;
  final _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isEditing = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              focusNode: _focusNode,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) {
                context.read<GithubSearchBloc>().add(TextChanged(text: _text));
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  // Adjust the radius here
                  borderSide: BorderSide.none, // Remove the border side
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
              ),
            ),
          ),
          if (_isEditing) const SizedBox(width: 8.0),
          if (_isEditing)
            TextButton(
              onPressed: () {
                // Handle the cancel action here
                log('Cancel clicked');
                // Clear the TextField and remove focus
                _focusNode.unfocus();
                _textController.clear();
              },
              child: const Text('Cancel', style: TextStyle(fontSize: 20)),
            ),
        ],
      ),
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
                  Text('Please enter a term to begin',
                      style: TextStyle(fontSize: 24)),
                ],
              ),
            SearchStateLoading() => const CircularProgressIndicator.adaptive(),
            SearchStateError() => Column(
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
            SearchStateSuccess() => state.items.isEmpty
                ? const Text('No Results')
                : Expanded(child: SearchResults(items: state.items)),
          },
        );
      },
    );
  }
}
