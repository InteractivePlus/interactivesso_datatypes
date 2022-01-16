import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/src/OAuth/scope.dart';
import 'package:json_annotation/json_annotation.dart';

part  'useroauthauthorization.g.dart';

@JsonSerializable()
class UserOAuthAuthorization implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'oauth_setting')
  OAuthPermissionInfo authorizedOAuthSetting;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  @JsonKey(name: 'custom_role')
  int? customRole;

  UserOAuthAuthorization({
    required this.authorizedOAuthSetting,
    required this.appClientId,
    required this.userUniqueId,
    this.customRole
  });
  factory UserOAuthAuthorization.fromMap(Map<String,dynamic> json) => _$UserOAuthAuthorizationFromJson(json);
  @override
  Map<String,dynamic> toJson() => _$UserOAuthAuthorizationToJson(this);
  @override
  Map<String, dynamic> serialize([String? locale]) => toJson();
  static UserOAuthAuthorization fromJson(Map<String,dynamic> json) => UserOAuthAuthorization.fromMap(json);
  static UserOAuthAuthorization? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
}