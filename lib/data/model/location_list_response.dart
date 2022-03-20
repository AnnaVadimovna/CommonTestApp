import 'package:json_annotation/json_annotation.dart';
import 'package:common_test/data/model/location_model.dart';

part 'location_list_response.g.dart';

@JsonSerializable()
class LocationListResponse {
  final List<LocationModel> data;
  final bool hasMore;
  LocationListResponse({
    required this.data,
    required this.hasMore,
  });
  factory LocationListResponse.fromJson(Map<String, dynamic> json) => _$LocationListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationListResponseToJson(this);
}
