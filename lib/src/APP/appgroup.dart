
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

import 'permission.dart';

part 'appgroup.g.dart';

@JsonSerializable()
class APPGroupInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'group_id')
  String groupId;

  @JsonKey(required: true, name: 'display_name')
  String displayName;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(required: true, name: 'permission_override')
  APPPermissionInfo permissionOverride;

  @JsonKey(required: true, name: 'is_normal_app')
  bool isNormalAPP;

  @override
  Map<String, dynamic> serialize([String? locale]) => _$APPGroupInfoToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);

  APPGroupInfo({required this.groupId, required this.displayName, this.description, required this.permissionOverride, required this.isNormalAPP});
  factory APPGroupInfo.fromMap(Map<String,dynamic> map) => _$APPGroupInfoFromJson(map);
  static APPGroupInfo fromJson(Map<String,dynamic> json) => APPGroupInfo.fromMap(json);
}