import 'package:github_api_client/src/models/github_detail/repos_owner.dart';

class GithubRepos {
  final String fullName;
  final String htmlUrl;
  final String? language;
  final String? description;
  final int stargazersCount;
  final int forksCount;
  final String updatedAt;
  final ReposOwner owner;

  GithubRepos({
    required this.fullName,
    required this.htmlUrl,
    this.language,
    this.description,
    required this.stargazersCount,
    required this.forksCount,
    required this.updatedAt,
    required this.owner,
  });

  factory GithubRepos.fromJson(Map<String, dynamic> json) {
    return GithubRepos(
      fullName: json['full_name'] as String,
      htmlUrl: json['html_url'] as String,
      language: json['language'] as String?,
      description: json['description'] as String?,
      stargazersCount: json['stargazers_count'] as int,
      forksCount: json['forks_count'] as int,
      updatedAt: json['updated_at'] as String,
      owner: ReposOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );
  }
}
