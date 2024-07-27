import 'package:github_api_client/github_api_client.dart' show GithubApiClient, SearchResult;
import 'models/models.dart';

class GithubRepository {
  final GithubApiClient client;

  GithubRepository({
    required this.client,
  });

  Future<RepositorySearchResult> githubRepositorySearch(String term) async {
    final SearchResult result = await client.githubRepositorySearch(term);

    final List<RepositoryResultItem> items = result.items.map((item) =>
        RepositoryResultItem(
          fullName: item.fullName,
          avatarUrl: item.owner.avatarUrl,
          htmlUrl: item.htmlUrl,
        )
    ).toList();

    return RepositorySearchResult(items: items);
  }
}
