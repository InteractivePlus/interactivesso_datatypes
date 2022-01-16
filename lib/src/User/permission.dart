import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class UserPermissionInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(name: 'can_login')
  bool? canLogin;

  @JsonKey(name: 'can_modify_account')
  bool? canModifyAccount;

  @JsonKey(name: 'can_view_managing_apps')
  bool? canViewManagingApps;

  @JsonKey(name: 'can_edit_owned_apps')
  bool? canModifyOwnedApps;

  @JsonKey(name: 'can_create_app')
  bool? canCreateAPP;

  @JsonKey(name:"can_manage_normal_users")
  bool? canManageNormalUsers;

  @JsonKey(name:"can_manage_other_admins")
  bool? canManageOtherAdmins;

  @JsonKey(name: 'can_manage_normal_apps')
  bool? canManageNormalAPPs;

  @JsonKey(name: "can_manage_special_apps")
  bool? canManageSpecialAPPs;

  @JsonKey(name: "max_owned_apps")
  int? maxOwnedAPPs;

  bool get isEmpty {
    return (
      canCreateAPP == null 
      && canManageNormalAPPs == null
      && canManageSpecialAPPs == null
      && canManageNormalUsers == null
      && canManageOtherAdmins == null
      && maxOwnedAPPs == null
      && canModifyOwnedApps == null
      && canViewManagingApps == null
      && canModifyAccount == null
      && canLogin == null
    );
  }

  /// Returns true is all fields has been set to non-null
  bool get isConcrete{
    return (
      canCreateAPP != null 
      && canManageNormalAPPs != null
      && canManageSpecialAPPs != null
      && canManageNormalUsers != null
      && canManageOtherAdmins != null
      && maxOwnedAPPs != null
      && canModifyOwnedApps != null
      && canViewManagingApps != null
      && canModifyAccount != null
      && canLogin != null
    );
  }

  UserPermissionInfo({this.canCreateAPP,this.canManageNormalUsers, this.canManageOtherAdmins, this.canManageNormalAPPs, this.canManageSpecialAPPs, this.maxOwnedAPPs, this.canLogin, this.canModifyAccount, this.canModifyOwnedApps, this.canViewManagingApps});
  UserPermissionInfo.copy(UserPermissionInfo other){
    canCreateAPP = other.canCreateAPP;
    canManageNormalUsers = other.canManageNormalUsers;
    canManageOtherAdmins = other.canManageOtherAdmins;
    canManageNormalAPPs = other.canManageNormalAPPs;
    canManageSpecialAPPs = other.canManageSpecialAPPs;
    maxOwnedAPPs = other.maxOwnedAPPs;
    canModifyOwnedApps = other.canModifyOwnedApps;
    canViewManagingApps = other.canViewManagingApps;
    canModifyAccount = other.canModifyAccount;
    canLogin = other.canLogin;
  }
  factory UserPermissionInfo.fromMap(Map<String,dynamic> map) => _$UserPermissionInfoFromJson(map);
  static UserPermissionInfo fromJson(Map<String,dynamic> json) => UserPermissionInfo.fromMap(json);
  static UserPermissionInfo? fromJsonNullable(Map<String,dynamic>? json){
    if(json == null){
      return null;
    }else{
      return fromJson(json);
    }
  }
  @override
  Map<String, dynamic> serialize([String? locale]) => _$UserPermissionInfoToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);


  /// Function used to combine permission items together
  /// 
  /// The permisison infos at the front of the list(starting from index 0 of the lsit) will have higher priority than the latter ones.
  static UserPermissionInfo combinePermission(Iterable<UserPermissionInfo> permisisons){
    if(permisisons.isEmpty){
      return UserPermissionInfo();
    }
    UserPermissionInfo combinedInfo = UserPermissionInfo.copy(permisisons.first);
    if(combinedInfo.isConcrete){
      return combinedInfo;
    }
    for(UserPermissionInfo i in permisisons.skip(1)){
      _combinePermissionInfoMutable(combinedInfo, i);
      if(combinedInfo.isConcrete){
        return combinedInfo;
      }
    }
    return combinedInfo;
  }

  static void _combinePermissionInfoMutable(UserPermissionInfo mutable,UserPermissionInfo other){
    mutable.canCreateAPP ??= other.canCreateAPP;
    mutable.canManageNormalUsers ??= other.canManageNormalUsers;
    mutable.canManageOtherAdmins ??= other.canManageOtherAdmins;
    mutable.canManageNormalAPPs ??= other.canManageNormalAPPs;
    mutable.canManageSpecialAPPs ??= other.canManageSpecialAPPs;
    mutable.maxOwnedAPPs ??= other.maxOwnedAPPs;
    mutable.canModifyOwnedApps ??= other.canModifyOwnedApps;
    mutable.canViewManagingApps ??= other.canViewManagingApps;
    mutable.canModifyAccount ??= other.canModifyAccount;
    mutable.canLogin ??= other.canLogin;
  }
}