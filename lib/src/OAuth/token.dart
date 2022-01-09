
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/src/Common/expirableinfo.dart';
import 'package:interactivesso_datatypes/src/OAuth/exchangemethod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class OAuthToken implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'access_token')
  String accessToken;

  @JsonKey(required:true, name: 'refresh_token')
  String refreshToken;

  @JsonKey(required:true, name: 'access_token_expires')
  ExpirableInfo accessTokenExpires;

  @JsonKey(required: true, name: 'refresh_token_expires')
  ExpirableInfo refreshTokenExpires;

  @JsonKey(required:true, name: 'exchange_method', toJson: Serializable.convertToDynamicSerialized, fromJson: ExchangeMethod.fromJson)
  ExchangeMethod exchangeMethod;
  
  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  @JsonKey(name: 'custom_role')
  int? customRole;

  @JsonKey(required: true, name: 'valid')
  bool valid;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$OAuthTokenToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  OAuthToken({
    required this.userUniqueId, 
    required this.appClientId, 
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpires,
    required this.refreshTokenExpires,
    required this.exchangeMethod,
    this.customRole,
    required this.valid
  });
  factory OAuthToken.fromMap(Map<String,dynamic> map) => _$OAuthTokenFromJson(map);
  static OAuthToken fromJson(Map<String,dynamic> json) => OAuthToken.fromMap(json);
}