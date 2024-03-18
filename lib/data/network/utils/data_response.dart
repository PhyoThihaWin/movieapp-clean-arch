import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

/// Base Data Empty Response
@JsonSerializable()
class DataEmptyResponse {
  @JsonKey(name: "code")
  final int? code;

  @JsonKey(name: "message")
  final String? message;

  DataEmptyResponse(this.code, this.message);

  factory DataEmptyResponse.fromJson(Map<String, dynamic> json) =>
      _$DataEmptyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataEmptyResponseToJson(this);
}

/// Base Data Response
@JsonSerializable(genericArgumentFactories: true)
class DataResponse<T> {
  @JsonKey(name: "code")
  final int? code;

  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "results")
  final T? data;

  @JsonKey(name: "token")
  final String? token;

  DataResponse(this.code, this.message, this.data, this.token);

  factory DataResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DataResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$DataResponseToJson(this, toJsonT);
}
