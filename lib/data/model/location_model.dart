import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final double bearing;
  final String datetime;
  final double distanceFromLast;
  final String gpsStatus;
  final double lat;
  final double lon;
  final double speed;
  final double xAcc;
  final double yAcc;
  final double zAcc;
  LocationModel(
    this.bearing,
    this.datetime,
    this.distanceFromLast,
    this.gpsStatus,
    this.lat,
    this.lon,
    this.speed,
    this.xAcc,
    this.yAcc,
    this.zAcc,
  );
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
