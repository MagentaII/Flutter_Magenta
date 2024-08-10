import 'dart:convert';
import 'dart:developer';

import 'models/models.dart';
import 'package:http/http.dart' as http;

class GithubApiClient {
  final http.Client httpClient;
  final String baseUrl;

  GithubApiClient({
    http.Client? httpClient,
    this.baseUrl = 'https://api.github.com/',
  }) : httpClient = httpClient ?? http.Client();

  // Search Github Repository :
  // if success => return repository result
  // else error
  Future<SearchResult> githubRepositorySearch(String term) async {
    log('Github API Client and term is $term');
    try {
      final response = await httpClient.get(Uri.parse('${baseUrl}search/repositories?q=$term'));
      log('Github API Client and response is $response');
      final results = json.decode(response.body) as Map<String, dynamic>;
      log('StatusCode : ${response.statusCode}');
      if (response.statusCode == 200) {
        return SearchResult.fromJson(results);
      } else {
        throw SearchResultError.fromJson(results);
      }
    } catch (e) {
      log('Error occurred: $e');
      rethrow;
    }
  }

  Future<GithubRepos> getRepositoryDetail(String fullName) async {
    final response =
        await httpClient.get(Uri.parse('${baseUrl}repos/$fullName'));
    final results = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return GithubRepos.fromJson(results);
    } else {
      throw ReposError.fromJson(results);
    }
  }
}
