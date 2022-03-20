import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common_test/domain/model/location.dart';

part 'location_resolution.freezed.dart';

@freezed
class LocationResolution with _$LocationResolution {
  const factory LocationResolution.success(List<Location> data, bool hasMore) = Success;
  const factory LocationResolution.error(String? msg) = Error;
}
