// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APPPermissionInfo _$APPPermissionInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['oAuthPerm'],
  );
  return APPPermissionInfo(
    oAuthPermission:
        OAuthPermissionInfo.fromJson(json['oAuthPerm'] as Map<String, dynamic>),
    canVerifyOtherAppSecret: json['canVerifyOtherAppSecret'] as bool?,
  );
}

Map<String, dynamic> _$APPPermissionInfoToJson(APPPermissionInfo instance) =>
    <String, dynamic>{
      'canVerifyOtherAppSecret': instance.canVerifyOtherAppSecret,
      'oAuthPerm': instance.oAuthPermission,
    };
