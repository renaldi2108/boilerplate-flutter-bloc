import 'package:boilerplate/data/remote/user/user_remote_source.dart';
import 'package:boilerplate/shared/core/network/network_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late UserRemoteSource userRemoteSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    userRemoteSource = UserRemoteSource(mockApiClient);
  });

  group('UserRemoteSource', () {
    test('should return a list of users when the API response is successful', () async {
      final apiResponse = [
        {"id": 1, "name": "Leanne Graham", "email": "Sincere@april.biz"},
        {"id": 2, "name": "Ervin Howell", "email": "Shanna@melissa.tv"},
        {"id": 3, "name": "Clementine Bauch", "email": "Nathan@yesenia.net"},
      ];

      when(() => mockApiClient.exec(
        ApiMethod.GET,
        "/users",
        dataParameters: any(named: 'dataParameters'),
        queryParameters: any(named: 'queryParameters'),
      )).thenAnswer((_) async => ApiResponse.success(apiResponse));

      final result = await userRemoteSource.user();

      expect(result, isA<Right>());
      expect(result.getOrElse(() => []), isA<List>());
      expect(
        result.getOrElse(() => []),
        [
          {"id": 1, "name": "Leanne Graham", "email": "Sincere@april.biz"},
          {"id": 2, "name": "Ervin Howell", "email": "Shanna@melissa.tv"},
          {"id": 3, "name": "Clementine Bauch", "email": "Nathan@yesenia.net"},
        ],
      );
    });

  });
}
