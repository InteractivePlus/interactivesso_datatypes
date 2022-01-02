// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APPPermissionInfo _$APPPermissionInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['oauth_perm'],
  );
  return APPPermissionInfo(
    oAuthPermission: OAuthPermissionInfo.fromJson(
        json['oauth_perm'] as Map<String, dynamic>),
    canVerifyOtherAppSecret: json['can_verify_other_app_secret'] as bool?,
  );
}

Map<String, dynamic> _$APPPermissionInfoToJson(APPPermissionInfo instance) =>
    <String, dynamic>{
      'can_verify_other_app_secret': instance.canVerifyOtherAppSecret,
      'oauth_perm': instance.oAuthPermission,
    };
