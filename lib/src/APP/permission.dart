import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/src/OAuth/scope.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class APPPermissionInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(name:'canVerifyOtherAppSecret')
  bool? canVerifyOtherAppSecret;

  @JsonKey(required: true, name: 'oAuthPerm')
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

  factory APPPermissionInfo.fromMap(Map<String,dynamic> map) => _$APPPermissionInfoFromJson(map);
  static APPPermissionInfo fromJson(Map<String,dynamic> json) => APPPermissionInfo.fromMap(json);
}