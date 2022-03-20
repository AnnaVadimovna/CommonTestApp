import 'package:injectable/injectable.dart';
import 'package:common_test/data/api/location_api.dart';
import 'package:common_test/data/model/location_list_response.dart';
import 'package:common_test/domain/model/location.dart';
import 'package:common_test/domain/model/location_resolution.dart';
import 'package:retry/retry.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class LocationRepository {
  final Duration? delayFactor;
  final LocationApi _api;

  LocationRepository(this._api, {this.delayFactor});
  Future<LocationResolution> getLocationList() async {
    final pageResults = await RangeStream(0, 100)
        .asyncMap((page) => _loadOnePage(page))
        .takeWhileInclusive(
          (element) => element.maybeWhen(
            success: (_, hasMore) => hasMore,
            orElse: () => false,
          ),
        )
        .toList();
    List<Location> items = [];
    bool hasError = false;
    for (var element in pageResults) {
      element.when(
        success: (data, _) => items.addAll(data),
        error: (_) {
          hasError = true;
        },
      );
    }
    if (hasError) {
      return const LocationResolution.error(null);
    } else {
      return LocationResolution.success(items, false);
    }
  }

  Future<LocationResolution> _loadOnePage(int page) async {
    try {
      return await retry(
        () async {
          final list = await _api.getLocationList(page: page);
          final domainList = _toDomain(list);
          return LocationResolution.success(domainList, list.hasMore);
        },
        retryIf: (e) => true,
        delayFactor: delayFactor ?? const Duration(milliseconds: 200),
      );
    } catch (e) {
      return const LocationResolution.error(null);
    }
  }

  List<Location> _toDomain(LocationListResponse list) {
    return list.data
        .map(
          (e) => Location(
            bearing: e.bearing,
            datetime: DateTime.parse(e.datetime),
            distanceFromLast: e.distanceFromLast,
            gpsStatus: e.gpsStatus,
            lat: e.lat,
            lon: e.lon,
            speed: e.speed,
            xAcc: e.xAcc,
            yAcc: e.yAcc,
            zAcc: e.zAcc,
          ),
        )
        .toList();
  }
}
