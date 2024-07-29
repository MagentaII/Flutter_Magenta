import 'package:flutter_test/flutter_test.dart';
import 'package:github_api_client/github_api_client.dart';

void main() {
  group('GithubUser', () {
    group('fromJson', () {
      test('returns correct GithubUser object', () {
        expect(
            GithubUser.fromJson(
              <String, dynamic>{
                'login': 'flutter',
                'avatar_url':
                    'https://avatars.githubusercontent.com/u/14101776?v=4',
              },
            ),
            isA<GithubUser>()
                .having((g) => g.login, 'login', 'flutter')
                .having((g) => g.avatarUrl, 'avatar_url',
                'https://avatars.githubusercontent.com/u/14101776?v=4'),
        );
      });
    });
  });
}
