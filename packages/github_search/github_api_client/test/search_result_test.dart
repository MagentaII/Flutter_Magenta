import 'package:flutter_test/flutter_test.dart';
import 'package:github_api_client/github_api_client.dart';

void main() {
  group('SearchResult', () {
    group('fromJson', () {
      test('returns correct SearchResult object', () {
        expect(
          SearchResult.fromJson(
            <String, dynamic>{
              'items': [
                {
                  'full_name': 'flutter/flutter',
                  'html_url': 'https://github.com/flutter/flutter',
                  'owner': {
                    'login': 'flutter',
                    'avatar_url':
                        'https://avatars.githubusercontent.com/u/14101776?v=4',
                  }
                },
                {
                  'full_name': 'flutter/plugins',
                  'html_url': 'https://github.com/flutter/plugins',
                  'owner': {
                    'login': 'flutter',
                    'avatar_url':
                        'https://avatars.githubusercontent.com/u/14101776?v=4',
                  }
                }
              ]
            },
          ),
          isA<SearchResult>()
              .having(
                  (g) => g.items[0].fullName, 'full_name', 'flutter/flutter')
              .having((g) => g.items[0].htmlUrl, 'html_url',
                  'https://github.com/flutter/flutter')
              .having((g) => g.items[0].owner.login, 'login', 'flutter')
              .having((g) => g.items[0].owner.avatarUrl, 'avatar_url',
                  'https://avatars.githubusercontent.com/u/14101776?v=4')
              .having(
                  (g) => g.items[1].fullName, 'full_name', 'flutter/plugins')
              .having((g) => g.items[1].htmlUrl, 'html_url',
                  'https://github.com/flutter/plugins')
              .having((g) => g.items[1].owner.login, 'login', 'flutter')
              .having((g) => g.items[1].owner.avatarUrl, 'avatar_url',
                  'https://avatars.githubusercontent.com/u/14101776?v=4'),
        );
      });
    });
  });
}
