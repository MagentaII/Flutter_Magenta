import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key, required this.item});

  final RepositoryResultItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(item.avatarUrl),
      ),
      title: Text(item.fullName),
      onTap: () => launchUrl(Uri.parse(item.htmlUrl)),
    );
  }
}