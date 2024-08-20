import 'package:equatable/equatable.dart';
import 'package:github_api_client/github_api_client.dart';
import 'package:intl/intl.dart';

class RepositoryDetail extends Equatable {
  final String avatarUrl;
  final String fullName;
  final String? description;
  final String? language;
  final String updatedAt;
  final String htmlUrl;
  final int stargazersCount;
  final int forksCount;

  const RepositoryDetail({
    required this.avatarUrl,
    required this.fullName,
    this.description,
    this.language,
    required this.updatedAt,
    required this.htmlUrl,
    required this.stargazersCount,
    required this.forksCount,
  });

  @override
  List<Object> get props =>
      [avatarUrl, fullName, updatedAt, htmlUrl, stargazersCount, forksCount];

  factory RepositoryDetail.fromClient({
    required ReposOwner reposOwner,
    required GithubRepos githubRepos,
  }) {
    final DateTime dateTime = DateTime.parse(githubRepos.updatedAt);
    final String updatedAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);

    return RepositoryDetail(
      avatarUrl: reposOwner.avatarUrl,
      fullName: githubRepos.fullName,
      description: githubRepos.description,
      language: githubRepos.language,
      updatedAt: updatedAt,
      htmlUrl: githubRepos.htmlUrl,
      stargazersCount: githubRepos.stargazersCount,
      forksCount: githubRepos.forksCount,
    );
  }
}
