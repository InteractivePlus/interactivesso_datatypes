// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPermissionInfo _$UserPermissionInfoFromJson(Map<String, dynamic> json) =>
    UserPermissionInfo(
      canCreateAPP: json['canCreateAPP'] as bool?,
      canManageNormalUsers: json['canManageNormalUsers'] as bool?,
      canManageOtherAdmins: json['canManageOtherAdmins'] as bool?,
      canManageNormalAPPs: json['canManageNormalAPPs'] as bool?,
      canManageSpecialAPPs: json['canManageSpecialAPPs'] as bool?,
      maxOwnedAPPs: json['maxOwnedAPPs'] as int?,
    );

Map<String, dynamic> _$UserPermissionInfoToJson(UserPermissionInfo instance) =>
    <String, dynamic>{
      'canCreateAPP': instance.canCreateAPP,
      'canManageNormalUsers': instance.canManageNormalUsers,
      'canManageOtherAdmins': instance.canManageOtherAdmins,
      'canManageNormalAPPs': instance.canManageNormalAPPs,
      'canManageSpecialAPPs': instance.canManageSpecialAPPs,
      'maxOwnedAPPs': instance.maxOwnedAPPs,
    };
