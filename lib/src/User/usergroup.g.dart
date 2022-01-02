// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usergroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGroupInfo _$UserGroupInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'group_id',
      'display_name',
      'permission_override',
      'is_normal_user'
    ],
  );
  return UserGroupInfo(
    groupId: json['group_id'] as String,
    displayName: json['display_name'] as String,
    permissionOverride: UserPermissionInfo.fromJson(
        json['permission_override'] as Map<String, dynamic>),
    isNormalUser: json['is_normal_user'] as bool,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$UserGroupInfoToJson(UserGroupInfo instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'display_name': instance.displayName,
      'description': instance.description,
      'permission_override': instance.permissionOverride,
      'is_normal_user': instance.isNormalUser,
    };
