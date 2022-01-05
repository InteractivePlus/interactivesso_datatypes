// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPermissionInfo _$UserPermissionInfoFromJson(Map<String, dynamic> json) =>
    UserPermissionInfo(
      canOwnAPP: json['can_own_app'] as bool?,
      canManageNormalUsers: json['can_manage_normal_users'] as bool?,
      canManageOtherAdmins: json['can_manage_other_admins'] as bool?,
      canManageNormalAPPs: json['can_manage_normal_apps'] as bool?,
      canManageSpecialAPPs: json['can_manage_special_apps'] as bool?,
      maxOwnedAPPs: json['max_owned_apps'] as int?,
    );

Map<String, dynamic> _$UserPermissionInfoToJson(UserPermissionInfo instance) =>
    <String, dynamic>{
      'can_own_app': instance.canOwnAPP,
      'can_manage_normal_users': instance.canManageNormalUsers,
      'can_manage_other_admins': instance.canManageOtherAdmins,
      'can_manage_normal_apps': instance.canManageNormalAPPs,
      'can_manage_special_apps': instance.canManageSpecialAPPs,
      'max_owned_apps': instance.maxOwnedAPPs,
    };
