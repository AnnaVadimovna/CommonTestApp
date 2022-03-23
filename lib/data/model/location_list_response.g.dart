// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationListResponse _$LocationListResponseFromJson(
        Map<String, dynamic> json) =>
    LocationListResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$LocationListResponseToJson(
        LocationListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'hasMore': instance.hasMore,
    };
