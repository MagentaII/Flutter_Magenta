import 'package:github_repository/github_repository.dart';

class GithubCache {
  final _cache = <String, RepositorySearchResult>{};

  RepositorySearchResult? get(String term) {
    return _cache[term];
  }

  void set(String term, RepositorySearchResult result) {
    _cache[term] = result;
  }

  bool isContains(String term) {
    return _cache.containsKey(term);
  }

  void remove(String term) {
    _cache.remove(term);
  }
}
