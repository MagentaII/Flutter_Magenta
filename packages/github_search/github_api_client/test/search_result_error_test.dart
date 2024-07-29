import 'package:flutter_test/flutter_test.dart';
import 'package:github_api_client/github_api_client.dart';

void main() {
  group('SearchResultError', () {
    group('fromJson', () {
      test('returns correct SearchResultError object', () {
        expect(
          SearchResultError.fromJson(
            <String, dynamic>{
              'message': 'Validation Failed',
            },
          ),
          isA<SearchResultError>()
              .having((g) => g.message, 'message', 'Validation Failed'),
        );
      });
    });
  });
}
