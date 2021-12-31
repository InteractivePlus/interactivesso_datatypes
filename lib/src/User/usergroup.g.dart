// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usergroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGroupInfo _$UserGroupInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['groupId', 'displayName', 'isNormalUser'],
  );
  return UserGroupInfo(
    groupId: json['groupId'] as String,
    displayName: json['displayName'] as String,
    permissionOverride: UserPermissionInfo.fromJson(
        json['permissionOverride'] as Map<String, dynamic>),
    isNormalUser: json['isNormalUser'] as bool,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$UserGroupInfoToJson(UserGroupInfo instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'displayName': instance.displayName,
      'description': instance.description,
      'permissionOverride': instance.permissionOverride,
      'isNormalUser': instance.isNormalUser,
    };
