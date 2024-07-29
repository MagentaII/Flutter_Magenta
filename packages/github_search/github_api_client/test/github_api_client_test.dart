import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_api_client/github_api_client.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

// 創建一個 Mock 的 http 客戶端
class MockClient extends Mock implements http.Client {}

void main() {
  group('GithubApiClient', () {
    late MockClient mockClient;
    late GithubApiClient githubApiClient;

    setUp(() {
      mockClient = MockClient();
      githubApiClient = GithubApiClient(httpClient: mockClient);
    });

    group('GithubApiClient Constructor', () {
      test('uses default baseUrl and httpClient if none provided', () {
        final client = GithubApiClient();

        expect(client.httpClient, isA<http.Client>());
        expect(client.baseUrl, 'https://api.github.com/search/repositories?q=');
      });

      test('uses provided httpClient and baseUrl', () {
        final mockClient = MockClient();
        const customBaseUrl = 'https://api.custom.com/search/repositories?q=';
        final client =
            GithubApiClient(httpClient: mockClient, baseUrl: customBaseUrl);

        expect(client.httpClient, mockClient);
        expect(client.baseUrl, customBaseUrl);
      });
    });

    group('githubRepositorySearch', () {
      test('returns SearchResult if the http call completes successfully',
          () async {
        // 準備測試數據
        final jsonResponse = jsonEncode({
          'items': [
            {
              'full_name': 'flutter/flutter',
              'html_url': 'https://github.com/flutter/flutter',
              'owner': {
                'login': 'flutter',
                'avatar_url':
                    'https://avatars.githubusercontent.com/u/14101776?v=4',
              }
            }
          ]
        });

        // 設定 mock 客戶端的行為
        when(() => mockClient.get(
                Uri.parse('https://api.github.com/search/repositories?q=test')))
            .thenAnswer((_) async => http.Response(jsonResponse, 200));

        // 執行方法
        final result = await githubApiClient.githubRepositorySearch('test');

        // 驗證結果
        expect(result.items, hasLength(1));
        expect(result.items[0].fullName, 'flutter/flutter');
        expect(result.items[0].htmlUrl, 'https://github.com/flutter/flutter');
        expect(result.items[0].owner.login, 'flutter');
        expect(result.items[0].owner.avatarUrl,
            'https://avatars.githubusercontent.com/u/14101776?v=4');
      });

      test('throws an exception if the http call completes with an error',
          () async {
        // 準備測試數據
        final jsonResponse = jsonEncode({'message': 'Not Found'});

        // 設定 mock 客戶端的行為
        when(() => mockClient.get(
                Uri.parse('https://api.github.com/search/repositories?q=test')))
            .thenAnswer((_) async => http.Response(jsonResponse, 404));

        // 執行方法並驗證異常
        expect(
          () async => await githubApiClient.githubRepositorySearch('test'),
          throwsA(isA<SearchResultError>()),
        );
      });
    });
  });
}
