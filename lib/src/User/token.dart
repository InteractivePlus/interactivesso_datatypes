import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Common/expirableinfo.dart';

part 'token.g.dart';

@JsonSerializable()
class UserToken implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'access_token')
  String accessToken;

  @JsonKey(required: true, name: 'refresh_token')
  String refreshToken;

  @JsonKey(required: true, name: 'access_token_expires')
  ExpirableInfo accessTokenExpires;

  @JsonKey(required: true, name: 'refresh_token_expires')
  ExpirableInfo refreshTokenExpires;

  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  @JsonKey(required: true, name: 'required')
  bool valid;

  @JsonKey(name: 'issued_ip')
  String? issuedIP;

  @JsonKey(name: 'renewed_ip')
  String? renewedIP;

  @override
  Map<String, dynamic> serialize([String? locale]) => _$UserTokenToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);

  UserToken({
    required this.accessToken, 
    required this.refreshToken, 
    required this.accessTokenExpires, 
    required this.refreshTokenExpires, 
    required this.userUniqueId, 
    required this.valid, 
    this.issuedIP, 
    this.renewedIP
  });
  factory UserToken.fromMap(Map<String,dynamic> map) => _$UserTokenFromJson(map);
  static UserToken fromJson(Map<String,dynamic> json) => UserToken.fromMap(json);
}