import 'package:flutter_test/flutter_test.dart';
import 'package:github_api_client/github_api_client.dart';

void main() {
  group('SearchResultItem', () {
    group('fromJson', () {
      test('returns correct SearchResultItem object', () {
        expect(
          SearchResultItem.fromJson(
            <String, dynamic>{
              'full_name': 'flutter/flutter',
              'html_url': 'https://github.com/flutter/flutter',
              'owner': {
                'login': 'flutter',
                'avatar_url':
                    'https://avatars.githubusercontent.com/u/14101776?v=4',
              }
            },
          ),
          isA<SearchResultItem>()
              .having((g) => g.fullName, 'full_name', 'flutter/flutter')
              .having((g) => g.htmlUrl, 'html_url',
                  'https://github.com/flutter/flutter')
              .having((g) => g.owner.login, 'login', 'flutter')
              .having((g) => g.owner.avatarUrl, 'avatar_url',
                  'https://avatars.githubusercontent.com/u/14101776?v=4'),
        );
      });
    });
  });
}
