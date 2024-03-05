// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$loadingImpl _$$loadingImplFromJson(Map<String, dynamic> json) =>
    _$loadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$loadingImplToJson(_$loadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$loadedImpl _$$loadedImplFromJson(Map<String, dynamic> json) => _$loadedImpl(
      Todos.fromJson(json['todos'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$loadedImplToJson(_$loadedImpl instance) =>
    <String, dynamic>{
      'todos': instance.todos,
      'runtimeType': instance.$type,
    };

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
      message: json['message'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
