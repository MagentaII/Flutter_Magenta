import 'package:github_api_client/github_api_client.dart'
    show
        GithubApiClient,
        GithubRepos,
        SearchResult,
        SearchResultError,
        ReposError;
import 'github_cache.dart';
import 'models/models.dart';

class GithubRepository {
  final GithubApiClient _client;
  final GithubCache cache;

  GithubRepository({
    GithubApiClient? client,
    required this.cache,
  }) : _client = client ?? GithubApiClient();

  Future<RepositorySearchResult> githubRepositorySearch(String term) async {
    final RepositorySearchResult? cacheResult = cache.get(term);
    if (cacheResult != null) {
      final List<RepositoryResultItem> items = cacheResult.items
          .map((item) => RepositoryResultItem(
                fullName: item.fullName,
                avatarUrl: item.avatarUrl,
                htmlUrl: item.htmlUrl,
              ))
          .toList();
      return RepositorySearchResult(items: items);
    }

    try {
      final SearchResult result = await _client.githubRepositorySearch(term);
      final List<RepositoryResultItem> items = result.items
          .map((item) => RepositoryResultItem(
                fullName: item.fullName,
                avatarUrl: item.owner.avatarUrl,
                htmlUrl: item.htmlUrl,
              ))
          .toList();
      cache.set(term, RepositorySearchResult(items: items));
      return RepositorySearchResult(items: items);
    } catch (error) {
      error is SearchResultError
          ? throw RepositorySearchError.fromJson(error.toJson())
          : throw const RepositorySearchError(
              message: 'An unknown error occurred');
    }
  }

  Future<RepositoryDetail> getRepositoryDetail(String fullName) async {
    try {
      final GithubRepos githubRepos =
          await _client.getRepositoryDetail(fullName);
      return RepositoryDetail.fromClient(
        reposOwner: githubRepos.owner,
        githubRepos: githubRepos,
      );
    } catch (error) {
      error is ReposError
          ? throw RepositoryError.fromJson(error.toJson())
          : throw RepositoryError(message: 'An unknown error occurred');
    }
  }
}
