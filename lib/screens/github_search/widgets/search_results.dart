import 'package:flutter/material.dart';
import 'package:flutter_magenta/screens/github_search/widgets/search_result_item.dart';
import 'package:github_repository/github_repository.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key, required this.items});

  final List<RepositoryResultItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return SearchResultItem(item: items[index]);
      },
    );
  }
}