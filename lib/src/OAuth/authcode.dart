
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/src/Common/expirableinfo.dart';
import 'package:interactivesso_datatypes/src/OAuth/scope.dart';
import 'package:json_annotation/json_annotation.dart';
import 'exchangemethod.dart';

part 'authcode.g.dart';

@JsonSerializable()
class AuthorizationCode implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'auth_code')
  String authCodeId;

  @JsonKey(required: true, name: 'challenge_type', fromJson: AuthCodeChallengeTypes.fromJson, toJson: Serializable.convertToDynamicSerialized)
  AuthCodeChallengeTypes challengeType; 

  @JsonKey(name: 'challenge')
  String? challenge;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  @JsonKey(required: true, name: 'oauth_setting')
  OAuthPermissionInfo authorizedOAuthSetting;

  @JsonKey(required: true, name: 'time_info')
  ExpirableInfo expirableInfo;

  @JsonKey(required: true, name: 'username')
  String username;

  @JsonKey(required: true, name: 'exchange_method', toJson: Serializable.convertToDynamicSerialized, fromJson: ExchangeMethod.fromJson)
  ExchangeMethod exchangeMethod;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$AuthorizationCodeToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  bool verifyCodeVerifier(String? verifier) => challengeType.verifyCodeVerifier(challenge,verifier);

  AuthorizationCode({
    required this.authCodeId, 
    required this.challengeType, 
    required String? challenge, 
    required this.appClientId, 
    required this.authorizedOAuthSetting, 
    required this.expirableInfo, 
    required this.username, 
    required this.exchangeMethod}
  ){
    if(challengeType.isValidChallengeString(challenge)){
      this.challenge = challenge;
    }else{
      throw InnerParseException();
    }
  }

  factory AuthorizationCode.fromMap(Map<String,dynamic> map) => _$AuthorizationCodeFromJson(map);
  static AuthorizationCode fromJson(Map<String,dynamic> json) => AuthorizationCode.fromMap(json);
}