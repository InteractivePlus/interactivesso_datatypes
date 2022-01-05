// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expirableinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpirableInfo _$ExpirableInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['create_time', 'expire_time'],
  );
  return ExpirableInfo(
    createTimeGMT: json['create_time'] as int,
    expireTimeGMT: json['expire_time'] as int,
  );
}

Map<String, dynamic> _$ExpirableInfoToJson(ExpirableInfo instance) =>
    <String, dynamic>{
      'create_time': instance.createTimeGMT,
      'expire_time': instance.expireTimeGMT,
    };
