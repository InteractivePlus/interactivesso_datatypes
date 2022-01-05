import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class UserPermissionInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(name: 'can_own_app')
  bool? canOwnAPP;

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
      canOwnAPP == null 
      && canManageNormalAPPs == null
      && canManageSpecialAPPs == null
      && canManageNormalUsers == null
      && canManageOtherAdmins == null
      && maxOwnedAPPs == null
    );
  }

  /// Returns true is all fields has been set to non-null
  bool get isConcrete{
    return (
      canOwnAPP != null 
      && canManageNormalAPPs != null
      && canManageSpecialAPPs != null
      && canManageNormalUsers != null
      && canManageOtherAdmins != null
      && maxOwnedAPPs != null
    );
  }

  UserPermissionInfo({this.canOwnAPP,this.canManageNormalUsers, this.canManageOtherAdmins, this.canManageNormalAPPs, this.canManageSpecialAPPs, this.maxOwnedAPPs});
  UserPermissionInfo.copy(UserPermissionInfo other){
    canOwnAPP = other.canOwnAPP;
    canManageNormalUsers = other.canManageNormalUsers;
    canManageOtherAdmins = other.canManageOtherAdmins;
    canManageNormalAPPs = other.canManageNormalAPPs;
    canManageSpecialAPPs = other.canManageSpecialAPPs;
    maxOwnedAPPs = other.maxOwnedAPPs;
  }
  factory UserPermissionInfo.fromMap(Map<String,dynamic> map) => _$UserPermissionInfoFromJson(map);
  static UserPermissionInfo fromJson(Map<String,dynamic> json) => UserPermissionInfo.fromMap(json);
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
    mutable.canOwnAPP ??= other.canOwnAPP;
    mutable.canManageNormalUsers ??= other.canManageNormalUsers;
    mutable.canManageOtherAdmins ??= other.canManageOtherAdmins;
    mutable.canManageNormalAPPs ??= other.canManageNormalAPPs;
    mutable.canManageSpecialAPPs ??= other.canManageSpecialAPPs;
    mutable.maxOwnedAPPs ??= other.maxOwnedAPPs;
  }
}