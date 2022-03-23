// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      (json['bearing'] as num).toDouble(),
      json['datetime'] as String,
      (json['distanceFromLast'] as num).toDouble(),
      json['gpsStatus'] as String,
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
      (json['speed'] as num).toDouble(),
      (json['xAcc'] as num).toDouble(),
      (json['yAcc'] as num).toDouble(),
      (json['zAcc'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'bearing': instance.bearing,
      'datetime': instance.datetime,
      'distanceFromLast': instance.distanceFromLast,
      'gpsStatus': instance.gpsStatus,
      'lat': instance.lat,
      'lon': instance.lon,
      'speed': instance.speed,
      'xAcc': instance.xAcc,
      'yAcc': instance.yAcc,
      'zAcc': instance.zAcc,
    };
