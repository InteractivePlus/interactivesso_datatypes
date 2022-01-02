// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appgroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APPGroupInfo _$APPGroupInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'group_id',
      'display_name',
      'permission_override',
      'is_normal_app'
    ],
  );
  return APPGroupInfo(
    groupId: json['group_id'] as String,
    displayName: json['display_name'] as String,
    description: json['description'] as String?,
    permissionOverride: APPPermissionInfo.fromJson(
        json['permission_override'] as Map<String, dynamic>),
    isNormalAPP: json['is_normal_app'] as bool,
  );
}

Map<String, dynamic> _$APPGroupInfoToJson(APPGroupInfo instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'display_name': instance.displayName,
      'description': instance.description,
      'permission_override': instance.permissionOverride,
      'is_normal_app': instance.isNormalAPP,
    };
