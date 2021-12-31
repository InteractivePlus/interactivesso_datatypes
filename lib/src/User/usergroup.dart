import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/src/User/permission.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usergroup.g.dart';

@JsonSerializable()
class UserGroupInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'groupId')
  String groupId;

  @JsonKey(required: true, name: 'displayName')
  String displayName;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'permissionOverride')
  UserPermissionInfo permissionOverride;

  @JsonKey(required: true, name: 'isNormalUser')
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

  @override
  Map<String, dynamic> serialize([String? locale]) => _$UserGroupInfoToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);
}