// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataEmptyResponse _$DataEmptyResponseFromJson(Map<String, dynamic> json) =>
    DataEmptyResponse(
      (json['code'] as num?)?.toInt(),
      json['message'] as String?,
    );

Map<String, dynamic> _$DataEmptyResponseToJson(DataEmptyResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

DataResponse<T> _$DataResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    DataResponse<T>(
      (json['code'] as num?)?.toInt(),
      json['message'] as String?,
      _$nullableGenericFromJson(json['results'], fromJsonT),
      json['token'] as String?,
    );

Map<String, dynamic> _$DataResponseToJson<T>(
  DataResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'results': _$nullableGenericToJson(instance.data, toJsonT),
      'token': instance.token,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
