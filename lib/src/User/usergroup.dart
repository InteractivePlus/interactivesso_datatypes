import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/src/User/permission.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usergroup.g.dart';

@JsonSerializable()
class UserGroupInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'group_id')
  String groupId;

  @JsonKey(required: true, name: 'display_name')
  String displayName;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(required: true, name: 'permission_override')
  UserPermissionInfo permissionOverride;

  @JsonKey(required: true, name: 'is_normal_user')
  bool isNormalUser;

  UserGroupInfo({
    required this.groupId, 
    required this.displayName,
    required this.permissionOverride,
    required this.isNormalUser,
    this.description
  });

  UserGroupInfo.copy(UserGroupInfo other) : this(
    groupId: other.groupId, 
    displayName: other.displayName, 
    permissionOverride: other.permissionOverride, 
    isNormalUser: other.isNormalUser,
    description: other.description
  );

  factory UserGroupInfo.fromMap(Map<String,dynamic> map) => _$UserGroupInfoFromJson(map);
  static UserGroupInfo fromJson(Map<String,dynamic> json) => UserGroupInfo.fromMap(json);
  static UserGroupInfo? fromJsonNullable(Map<String,dynamic>? json){
    if(json == null){
      return null;
    }else{
      return fromJson(json);
    }
  }

  @override
  Map<String, dynamic> serialize([String? locale]) => _$UserGroupInfoToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);
}