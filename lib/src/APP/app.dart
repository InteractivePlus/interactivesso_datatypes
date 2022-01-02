

import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/src/APP/permission.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app.g.dart';

@JsonSerializable()
class ApplicationCreationInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'created_by')
  final String createdByUsername;

  @JsonKey(required: true, name: 'create_time')
  final int createTimeGMT;

  @JsonKey(name: 'create_ip')
  final String? createIPAddress;

  @override
  Map<String, dynamic> serialize([String? locale]) => _$ApplicationCreationInfoToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);
  
  const ApplicationCreationInfo(this.createdByUsername, this.createTimeGMT, [this.createIPAddress]);
  factory ApplicationCreationInfo.fromMap(Map<String,dynamic> map) => _$ApplicationCreationInfoFromJson(map);
  static ApplicationCreationInfo fromJson(Map<String,dynamic> json) => ApplicationCreationInfo.fromMap(json);
}

@JsonSerializable()
class ApplicationManagementInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'owner')
  String ownerUsername;
  
  @JsonKey(required: true, name: 'admin_list')
  List<String> adminListUsernames;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$ApplicationManagementInfoToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  ApplicationManagementInfo(this.ownerUsername, this.adminListUsernames);
  factory ApplicationManagementInfo.fromMap(Map<String,dynamic> map)  => _$ApplicationManagementInfoFromJson(map);
  static ApplicationManagementInfo fromJson(Map<String,dynamic> json) => ApplicationManagementInfo.fromMap(json);
}

@JsonSerializable()
class ApplicationInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'appGroup')
  String belongedAPPGroupId;

  @JsonKey(required: true, name: 'client_id')
  String clientId;

  @JsonKey(required: true, name: 'client_secret')
  String clientSecret;

  @JsonKey(required: true, name: 'display_name')
  String displayName;

  @JsonKey(required: true, name: 'description')
  String description;

  @JsonKey(required: true, name: 'permission')
  APPPermissionInfo permissionOverride;

  @JsonKey(required: true, name: 'creationInfo')
  ApplicationCreationInfo creationInfo;

  @JsonKey(required: true, name: 'manageInfo')
  ApplicationManagementInfo manageInfo;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$ApplicationInfoToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  ApplicationInfo({
    required this.clientId, 
    required this.clientSecret, 
    required this.displayName, 
    required this.description, 
    required this.permissionOverride, 
    required this.creationInfo, 
    required this.manageInfo,
    required this.belongedAPPGroupId
  });

  factory ApplicationInfo.fromMap(Map<String,dynamic> map) => _$ApplicationInfoFromJson(map);
  static ApplicationInfo fromJson(Map<String,dynamic> json) => ApplicationInfo.fromMap(json);
}