import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:common_test/data/api/location_api.dart';
import 'package:common_test/data/model/location_list_response.dart';
import 'package:common_test/data/model/location_model.dart';
import 'package:common_test/domain/model/location_resolution.dart' as location_resolution;
import 'package:common_test/domain/repository/location_repository.dart';

import 'location_repository_test.mocks.dart';

@GenerateMocks([LocationApi])
void main() {
  group("Repository return", () {
    test('value - with only one page from api', () async {
      final api = MockLocationApi();
      when(api.getLocationList(page: 0))
          .thenAnswer((_) async => LocationListResponse(data: [_stub(), _stub()], hasMore: false));

      final repository = LocationRepository(api);
      final result = await repository.getLocationList();

      expect(result is location_resolution.Success, true);
      expect((result as location_resolution.Success).data.length, 2);
    });

    test('value - with only two page from api', () async {
      final api = MockLocationApi();
      when(api.getLocationList(page: 0))
          .thenAnswer((_) async => LocationListResponse(data: [_stub(), _stub()], hasMore: true));
      when(api.getLocationList(page: 1))
          .thenAnswer((_) async => LocationListResponse(data: [_stub(), _stub()], hasMore: false));

      final repository = LocationRepository(api);
      final result = await repository.getLocationList();

      expect(result is location_resolution.Success, true);
      expect((result as location_resolution.Success).data.length, 4);
    });

    test('error - with only error calls from api', () async {
      final api = MockLocationApi();
      when(api.getLocationList(page: 0)).thenAnswer((_) async => throw const HttpException(""));

      final repository = LocationRepository(api, delayFactor: Duration.zero);
      final result = await repository.getLocationList();

      expect(result is location_resolution.Error, true);
      verify(api.getLocationList(page: 0)).called(greaterThan(1));
    });
    test('result - with success after error calls from api', () async {
      final api = MockLocationApi();
      when(api.getLocationList(page: 0)).thenAnswer((_) async => throw const HttpException(""));

      untilCalled(api.getLocationList(page: 0)).then((value) {
        when(api.getLocationList(page: 0))
            .thenAnswer((_) async => LocationListResponse(data: [_stub(), _stub()], hasMore: false));
      });

      final repository = LocationRepository(api, delayFactor: const Duration(milliseconds: 10));
      final result = await repository.getLocationList();
      result.toString();

      expect(result is location_resolution.Success, true);
      verify(api.getLocationList(page: 0)).called(2);
    });
  });
}

LocationModel _stub() {
  return LocationModel(
    0,
    DateTime.now().toIso8601String(),
    0,
    "",
    0,
    0,
    0,
    0,
    0,
    0,
  );
}
