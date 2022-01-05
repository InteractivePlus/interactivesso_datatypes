
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/src/Common/expirableinfo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authcode.g.dart';

class AuthCodeChallengeTypes implements Serializable<String>{
  final bool Function(String? challenge, String? verifier) verifyCodeVerifier;
  final bool Function(String? challenge) isValidChallengeString;
  final String? Function(String? verifier) encodeVerifierIntoChallenge;

  @override
  String serialize([String? locale]) {
    if(identical(this, NONE)){
      return "none";
    }else if(identical(this, PLAIN)){
      return 'plain';
    }else{
      return 's256';
    }
  }

  @override
  String toJson() => serialize(null);

  const AuthCodeChallengeTypes._({required this.verifyCodeVerifier, required this.isValidChallengeString, required this.encodeVerifierIntoChallenge});
  factory AuthCodeChallengeTypes.fromString(String str){
    if(str == 'none'){
      return NONE;
    }else if(str == 'plain'){
      return PLAIN;
    }else if(str == 's256'){
      return S256;
    }else{
      throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }
  static AuthCodeChallengeTypes fromJson(String json) => AuthCodeChallengeTypes.fromString(json);

  static const NONE = AuthCodeChallengeTypes._(verifyCodeVerifier: _NoneChallengeVerifyVerifier, isValidChallengeString: _isValidNoneChallenge, encodeVerifierIntoChallenge: _NoneEncodeVerifier);
  static const PLAIN = AuthCodeChallengeTypes._(verifyCodeVerifier: _PlainChallengeVerifyVerifier, isValidChallengeString: _isValidPlainChallenge, encodeVerifierIntoChallenge: _PlainEncodeVerifier);
  static const S256 = AuthCodeChallengeTypes._(verifyCodeVerifier: _S256ChallengeVerifyVerifier, isValidChallengeString: _isValidS256Challenge, encodeVerifierIntoChallenge: _S256EncodeVerifier);

  static bool _isValidPlainChallenge(String? challenge){
    return challenge != null;
  }
  static bool _isValidS256Challenge(String? challenge){
    return challenge != null && challenge.length == 64 && challenge.isValidHexString();
  }
  static bool _isValidNoneChallenge(String? challenge){
    return challenge == null;
  }
  static String? _PlainEncodeVerifier(String? verifier){
    return verifier;
  }
  static String? _S256EncodeVerifier(String? verifier){
    return verifier != null ? sha256.convert(utf8.encode(verifier)).toString() : null;
  }
  static String? _NoneEncodeVerifier(String? verifier){
    return null;
  }
  static bool _PlainChallengeVerifyVerifier(String? challenge, String? verifier){
    return challenge != null && challenge == verifier;
  }
  static bool _S256ChallengeVerifyVerifier(String? challenge, String? verifier){
    return verifier != null && challenge != null && _S256EncodeVerifier(verifier) == challenge;
  }
  static bool _NoneChallengeVerifyVerifier(String? challenge, String? verifier){
    return challenge == null && verifier == null;
  }
}

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

  @JsonKey(required: true, name: 'time_info')
  ExpirableInfo expirableInfo;

  @JsonKey(required: true, name: 'mask_id')
  String maskId;

  @JsonKey(required: true, name: 'username')
  String relatedUsername;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$AuthorizationCodeToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  AuthorizationCode({required this.authCodeId, required this.challengeType, required String? challenge, required this.appClientId, required this.expirableInfo, required this.maskId, required this.relatedUsername}){
    if(challengeType.isValidChallengeString(challenge)){
      this.challenge = challenge;
    }else{
      throw InnerParseException();
    }
  }

  factory AuthorizationCode.fromMap(Map<String,dynamic> map) => _$AuthorizationCodeFromJson(map);
  static AuthorizationCode fromJson(Map<String,dynamic> json) => AuthorizationCode.fromMap(json);
}