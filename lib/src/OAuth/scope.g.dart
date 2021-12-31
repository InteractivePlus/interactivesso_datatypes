// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthBasicInfoScopePermission _$OAuthBasicInfoScopePermissionFromJson(
        Map<String, dynamic> json) =>
    OAuthBasicInfoScopePermission(
      enabled: json['enabled'] as bool?,
    );

Map<String, dynamic> _$OAuthBasicInfoScopePermissionToJson(
        OAuthBasicInfoScopePermission instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

OAuthNotificationScopePermission _$OAuthNotificationScopePermissionFromJson(
        Map<String, dynamic> json) =>
    OAuthNotificationScopePermission(
      enabled: json['enabled'] as bool?,
      maxNumberPerUserPerDay: json['maxPerUserPerDay'] as int?,
      maxNumberPerUserPerMonth: json['maxPerUserPerMon'] as int?,
      maxNumberAllUserPerMonth: json['maxPerMon'] as int?,
    );

Map<String, dynamic> _$OAuthNotificationScopePermissionToJson(
        OAuthNotificationScopePermission instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'maxPerUserPerDay': instance.maxNumberPerUserPerDay,
      'maxPerUserPerMon': instance.maxNumberPerUserPerMonth,
      'maxPerMon': instance.maxNumberAllUserPerMonth,
    };

OAuthListManagedAppsScopePermission
    _$OAuthListManagedAppsScopePermissionFromJson(Map<String, dynamic> json) =>
        OAuthListManagedAppsScopePermission(
          enabled: json['enabled'] as bool,
          readAPPSecret: json['readSecret'] as bool?,
          readAPPDisplayNameAndDescription:
              json['readNameAndDescription'] as bool?,
        );

Map<String, dynamic> _$OAuthListManagedAppsScopePermissionToJson(
        OAuthListManagedAppsScopePermission instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'readSecret': instance.readAPPSecret,
      'readNameAndDescription': instance.readAPPDisplayNameAndDescription,
    };

OAuthPermissionInfo _$OAuthPermissionInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['basic_info', 'notification', 'list_managed_apps'],
  );
  return OAuthPermissionInfo(
    basicInfoPerm: OAuthBasicInfoScopePermission.fromJson(
        json['basic_info'] as Map<String, dynamic>),
    notificationPerm: OAuthNotificationScopePermission.fromJson(
        json['notification'] as Map<String, dynamic>),
    listManagedAppsPerm: OAuthListManagedAppsScopePermission.fromJson(
        json['list_managed_apps'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OAuthPermissionInfoToJson(
        OAuthPermissionInfo instance) =>
    <String, dynamic>{
      'basic_info': instance.basicInfoPerm,
      'notification': instance.notificationPerm,
      'list_managed_apps': instance.listManagedAppsPerm,
    };
