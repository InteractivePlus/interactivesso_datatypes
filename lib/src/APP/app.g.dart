// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationCreationInfo _$ApplicationCreationInfoFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['created_by', 'create_time'],
  );
  return ApplicationCreationInfo(
    json['created_by'] as String,
    json['create_time'] as int,
    json['create_ip'] as String?,
  );
}

Map<String, dynamic> _$ApplicationCreationInfoToJson(
        ApplicationCreationInfo instance) =>
    <String, dynamic>{
      'created_by': instance.createdByUsername,
      'create_time': instance.createTimeGMT,
      'create_ip': instance.createIPAddress,
    };

ApplicationManagementInfo _$ApplicationManagementInfoFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['owner', 'admin_list'],
  );
  return ApplicationManagementInfo(
    json['owner'] as String,
    (json['admin_list'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ApplicationManagementInfoToJson(
        ApplicationManagementInfo instance) =>
    <String, dynamic>{
      'owner': instance.ownerUsername,
      'admin_list': instance.adminListUsernames,
    };

ApplicationInfo _$ApplicationInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'app_group',
      'client_id',
      'client_secret',
      'display_name',
      'description',
      'permission',
      'creation_info',
      'manage_info'
    ],
  );
  return ApplicationInfo(
    clientId: json['client_id'] as String,
    clientSecret: json['client_secret'] as String,
    displayName: json['display_name'] as String,
    description: json['description'] as String,
    permissionOverride:
        APPPermissionInfo.fromJson(json['permission'] as Map<String, dynamic>),
    creationInfo: ApplicationCreationInfo.fromJson(
        json['creation_info'] as Map<String, dynamic>),
    manageInfo: ApplicationManagementInfo.fromJson(
        json['manage_info'] as Map<String, dynamic>),
    belongedAPPGroupId: json['app_group'] as String,
  );
}

Map<String, dynamic> _$ApplicationInfoToJson(ApplicationInfo instance) =>
    <String, dynamic>{
      'app_group': instance.belongedAPPGroupId,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'display_name': instance.displayName,
      'description': instance.description,
      'permission': instance.permissionOverride,
      'creation_info': instance.creationInfo,
      'manage_info': instance.manageInfo,
    };
