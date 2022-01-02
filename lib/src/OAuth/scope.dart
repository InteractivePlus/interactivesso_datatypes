import 'dart:math';

import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/src/Util/permission_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scope.g.dart';

class OAuthScope implements Serializable<String>{
  final String stringRep;
  const OAuthScope._(this.stringRep);

  factory OAuthScope.fromString(String st){
    if(st == BASIC_INFO.stringRep){
      return BASIC_INFO;
    }else if(st == NOTIFICATION.stringRep){
      return NOTIFICATION;
    }else if(st == LIST_MANAGED_APPS_AND_BASIC_INFO.stringRep){
      return LIST_MANAGED_APPS_AND_BASIC_INFO;
    }else{
      throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }

  static OAuthScope fromJson(String st) => OAuthScope.fromString(st);

  @override
  String serialize([String? locale]) => stringRep;

  @override
  String toJson() => serialize(null);

  @override
  String toString() => stringRep;

  @override
  int get hashCode => stringRep.hashCode;

  @override
  bool operator == (Object other) => identical(other, this);

  static const BASIC_INFO = OAuthScope._('basic_info');
  static const NOTIFICATION = OAuthScope._('notification');
  static const LIST_MANAGED_APPS_AND_BASIC_INFO = OAuthScope._('list_managed_apps');
}

abstract class OAuthSingleScopePermission{
  @JsonKey(name: 'enabled')
  bool? enabled;

  bool get isEmpty => enabled == null;

  bool get isConcrete => enabled != null;

  void mergePermission(OAuthSingleScopePermission toMergeIn){
    enabled ??= toMergeIn.enabled;
  }

  void settingMergePermission(OAuthSingleScopePermission permission){
    enabled = PermissionUtil.mergeItemIfBothNonNull(enabled, permission.enabled, PermissionUtil.mergeItemAnd);
  }

  void forceConcrete(){
    enabled ??= false;
  }

  OAuthSingleScopePermission({required this.enabled});
}

@JsonSerializable()
class OAuthBasicInfoScopePermission extends OAuthSingleScopePermission implements Serializable<Map<String,dynamic>>{
  OAuthBasicInfoScopePermission({required bool? enabled}) : super(enabled: enabled);
  @override
  Map<String, dynamic> serialize([String? locale]) => _$OAuthBasicInfoScopePermissionToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);

  factory OAuthBasicInfoScopePermission.fromMap(Map<String,dynamic> map) => _$OAuthBasicInfoScopePermissionFromJson(map);
  static OAuthBasicInfoScopePermission fromJson(Map<String,dynamic> json) => OAuthBasicInfoScopePermission.fromMap(json);
}

@JsonSerializable()
class OAuthNotificationScopePermission extends OAuthSingleScopePermission implements Serializable<Map<String,dynamic>>{
  @JsonKey(name:'max_per_user_per_day')
  int? maxNumberPerUserPerDay;

  @JsonKey(name:'max_per_user_per_mon')
  int? maxNumberPerUserPerMonth;

  @JsonKey(name:'max_per_mon')
  int? maxNumberAllUserPerMonth;

  @override
  void mergePermission(covariant OAuthNotificationScopePermission toMergeIn) {
    super.mergePermission(toMergeIn);
    maxNumberPerUserPerDay ??= toMergeIn.maxNumberPerUserPerDay;
    maxNumberPerUserPerMonth ??= toMergeIn.maxNumberAllUserPerMonth;
    maxNumberAllUserPerMonth ??= toMergeIn.maxNumberAllUserPerMonth;
  }

  @override
  void settingMergePermission(covariant OAuthNotificationScopePermission permission) {
    super.settingMergePermission(permission);
    maxNumberPerUserPerDay = PermissionUtil.mergeItemIfBothNonNull(maxNumberPerUserPerDay, permission.maxNumberPerUserPerDay, PermissionUtil.mergeItemMin);
    maxNumberPerUserPerMonth = PermissionUtil.mergeItemIfBothNonNull(maxNumberPerUserPerDay, permission.maxNumberPerUserPerDay, PermissionUtil.mergeItemMin);
    maxNumberPerUserPerDay = permission.maxNumberPerUserPerMonth;
  }

  @override
  void forceConcrete() {
    super.forceConcrete();
    maxNumberPerUserPerDay ??= 0;
    maxNumberPerUserPerDay ??= 0;
    maxNumberPerUserPerMonth ??= 0;
  }

  @override
  bool get isEmpty => super.isEmpty && maxNumberPerUserPerDay == null && maxNumberPerUserPerMonth == null && maxNumberAllUserPerMonth == null;
  
  @override
  bool get isConcrete => super.isConcrete && maxNumberPerUserPerDay != null && maxNumberPerUserPerMonth == null && maxNumberAllUserPerMonth != null;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$OAuthNotificationScopePermissionToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  OAuthNotificationScopePermission({required bool? enabled, this.maxNumberPerUserPerDay, this.maxNumberPerUserPerMonth, this.maxNumberAllUserPerMonth}) : super(enabled:enabled);
  
  factory OAuthNotificationScopePermission.fromMap(Map<String,dynamic> map) => _$OAuthNotificationScopePermissionFromJson(map);
  static OAuthNotificationScopePermission fromJson(Map<String,dynamic> json) => OAuthNotificationScopePermission.fromMap(json);
}

@JsonSerializable()
class OAuthListManagedAppsScopePermission extends OAuthSingleScopePermission implements Serializable<Map<String,dynamic>>{
  @JsonKey(ignore: true)
  bool get readAPPID => true;

  @JsonKey(name: 'manage_app')
  bool? manageAPP;

  @JsonKey(name: 'read_app_secret')
  bool? readAPPSecret;

  @JsonKey(name: 'read_display_name_and_description')
  bool? readAPPDisplayNameAndDescription;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$OAuthListManagedAppsScopePermissionToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  @override
  void mergePermission(covariant OAuthListManagedAppsScopePermission toMergeIn) {
    super.mergePermission(toMergeIn);
    readAPPSecret ??= toMergeIn.readAPPSecret;
    readAPPDisplayNameAndDescription ??= toMergeIn.readAPPDisplayNameAndDescription;
  }

  @override
  void settingMergePermission(covariant OAuthListManagedAppsScopePermission permission) {
    super.settingMergePermission(permission);
    readAPPSecret = PermissionUtil.mergeItemIfBothNonNull(readAPPSecret, permission.readAPPSecret, PermissionUtil.mergeItemAnd);
    readAPPDisplayNameAndDescription = PermissionUtil.mergeItemIfBothNonNull(readAPPDisplayNameAndDescription, permission.readAPPDisplayNameAndDescription, PermissionUtil.mergeItemAnd);
  }

  @override
  void forceConcrete() {
    super.forceConcrete();
    readAPPSecret ??= false;
    readAPPDisplayNameAndDescription ??= false;
  }

  @override
  bool get isEmpty => super.isEmpty && readAPPSecret == null && readAPPDisplayNameAndDescription == null;

  @override
  bool get isConcrete => super.isConcrete && readAPPSecret != null && readAPPDisplayNameAndDescription != null;

  OAuthListManagedAppsScopePermission({required bool enabled, this.manageAPP, this.readAPPSecret, this.readAPPDisplayNameAndDescription}) : super(enabled: enabled);

  factory OAuthListManagedAppsScopePermission.fromMap(Map<String,dynamic> map) => _$OAuthListManagedAppsScopePermissionFromJson(map);
  static OAuthListManagedAppsScopePermission fromJson(Map<String,dynamic> json) => OAuthListManagedAppsScopePermission.fromMap(json);
}

@JsonSerializable()
class OAuthPermissionInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'basic_info')
  OAuthBasicInfoScopePermission basicInfoPerm;

  @JsonKey(required: true, name: 'notification')
  OAuthNotificationScopePermission notificationPerm;

  @JsonKey(required: true, name: 'list_managed_apps')
  OAuthListManagedAppsScopePermission listManagedAppsPerm;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$OAuthPermissionInfoToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  bool get isEmpty => basicInfoPerm.isEmpty && notificationPerm.isEmpty && listManagedAppsPerm.isEmpty;

  bool get isConcrete => basicInfoPerm.isConcrete && notificationPerm.isConcrete && listManagedAppsPerm.isConcrete;

  void mergePermission(OAuthPermissionInfo toMergeIn) {
    basicInfoPerm.mergePermission(toMergeIn.basicInfoPerm);
    notificationPerm.mergePermission(toMergeIn.notificationPerm);
    listManagedAppsPerm.mergePermission(toMergeIn.listManagedAppsPerm);
  }

  void settingMergePermission(OAuthPermissionInfo toMergeIn) {
    basicInfoPerm.settingMergePermission(toMergeIn.basicInfoPerm);
    notificationPerm.settingMergePermission(toMergeIn.notificationPerm);
    listManagedAppsPerm.settingMergePermission(toMergeIn.listManagedAppsPerm);
  }

  void forceConcrete(){
    basicInfoPerm.forceConcrete();
    notificationPerm.forceConcrete();
    listManagedAppsPerm.forceConcrete();
  }

  OAuthPermissionInfo({required this.basicInfoPerm, required this.notificationPerm, required this.listManagedAppsPerm});

  factory OAuthPermissionInfo.fromMap(Map<String,dynamic> map) => _$OAuthPermissionInfoFromJson(map);
  static OAuthPermissionInfo fromJson(Map<String,dynamic> json) => OAuthPermissionInfo.fromMap(json);
}