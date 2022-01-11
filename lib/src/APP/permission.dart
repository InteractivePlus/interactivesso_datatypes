import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

import '../OAuth/scope.dart';

part 'permission.g.dart';

@JsonSerializable()
class APPPermissionInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(name:'can_verify_other_app_secret')
  bool? canVerifyOtherAppSecret;

  @JsonKey(required: true, name: 'oauth_perm')
  OAuthPermissionInfo oAuthPermission;
  
  void mergePermission(APPPermissionInfo toMergeIn){
    canVerifyOtherAppSecret ??= toMergeIn.canVerifyOtherAppSecret;
    oAuthPermission.mergePermission(toMergeIn.oAuthPermission);
  }

  bool get isEmpty => canVerifyOtherAppSecret == null && oAuthPermission.isEmpty;
  bool get isConcrete => canVerifyOtherAppSecret != null && oAuthPermission.isConcrete;

  void forceConcrete(){
    canVerifyOtherAppSecret ??= false;
    oAuthPermission.forceConcrete();
  }

  @override
  Map<String,dynamic> serialize([String? locale]) => _$APPPermissionInfoToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  APPPermissionInfo({required this.oAuthPermission, this.canVerifyOtherAppSecret});
  APPPermissionInfo.copy(APPPermissionInfo other) : this(
    oAuthPermission: OAuthPermissionInfo.copy(other.oAuthPermission),
    canVerifyOtherAppSecret: other.canVerifyOtherAppSecret
  );

  factory APPPermissionInfo.fromMap(Map<String,dynamic> map) => _$APPPermissionInfoFromJson(map);
  static APPPermissionInfo fromJson(Map<String,dynamic> json) => APPPermissionInfo.fromMap(json);
  static APPPermissionInfo? fromJsonNullable(Map<String,dynamic>? json){
    if(json == null){
      return null;
    }else{
      return fromJson(json);
    }
  }

  static final APPPermissionInfo EMPTY_MASK = APPPermissionInfo(oAuthPermission: OAuthPermissionInfo.EMPTY_MASK, canVerifyOtherAppSecret: null);
}