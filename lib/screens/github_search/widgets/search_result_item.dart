import 'package:flutter/material.dart';
import 'package:flutter_magenta/screens/github_search/views/github_repository_detail.dart';
import 'package:github_repository/github_repository.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key, required this.item});

  final RepositoryResultItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 24, // Adjust the size of the avatar
          backgroundImage: NetworkImage(item.avatarUrl),
        ),
        title: Text(
          item.fullName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        onTap: () {
          Navigator.of(context).push(
            GithubRepositoryDetail.route(item.fullName),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
